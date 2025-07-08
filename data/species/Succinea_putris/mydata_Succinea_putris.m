function [data, auxData, metaData, txtData, weights] = mydata_Succinea_putris
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Succineidae';
metaData.species    = 'Succinea_putris'; 
metaData.species_en = 'European ambersnail'; 

metaData.ecoCode.climate = {'BWk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf','biFm'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biH'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 18]; 

%% set data
% zero-variate data

data.ab  = 18;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'KuznPokr2013';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp  = 160;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'KuznPokr2013';   
  temp.tp = C2K(16);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am  = 365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'KuznPokr2013';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.1; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'KuznPokr2013';
data.Li  = 2.4; units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Wiki_nl';

data.Wwi  = 0.509; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'EoL';

data.Ri  = 128/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KuznPokr2013';   
  temp.Ri = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '64 eggs per clutch; 0.5 yr accumulation time assumed';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), number of whorls (#)
0	1.183
30	1.821
60	2.122
90	2.488
120	2.898
150	3.245
180	3.293
210	3.503
240	3.641
270	3.834
300	3.936
330	3.910];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KuznPokr2013';
comment.tL = 'based on number of whorls, assuming constant factors per whorl and Lb and Li';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki_nl'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53DZ2'; % Cat of Life
metaData.links.id_ITIS = '76948'; % ITIS
metaData.links.id_EoL = '596085'; % Ency of Life
metaData.links.id_Wiki = 'Succinea_putris'; % Wikipedia
metaData.links.id_ADW = 'Succinea_putris'; % ADW
metaData.links.id_Taxo = '38612'; % Taxonomicon
metaData.links.id_WoRMS = '1002805'; % WoRMS
metaData.links.id_molluscabase = '1002805'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Succinea_putris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuznPokr2013'; type = 'Article'; bib = [ ... 
'doi = {10.12657/folmal.021.024}, ' ...
'author = {El\dot{z}bietsa Ku\''{z}nik-Kowalska and Beata M. Pokryszko and Ma{\l}gorzata Pro\''{c}k\''{o}w and Marta Oczkowska}, ' ... 
'title = {ON THE POPULATION DYNAMICS, REPRODUCTIVE BIOLOGY AND GROWTH OF \emph{Succinea_putris} ({L}INNAEUS, 1758) ({G}ASTROPODA: {P}ULMONATA: {S}UCCINEIDAE)}, ' ...
'journal = {Folia Malacol.}, ' ...
'number = {4}, ' ...
'volume = {21}, ' ...
'year = {2013}, ' ...
'pages = {215-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/596085}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_nl'; type = 'Misc'; bib = ...
'howpublished = {\url{http://nl.wikipedia.org/wiki/Succinea_putris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

