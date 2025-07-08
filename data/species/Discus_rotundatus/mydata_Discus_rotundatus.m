function [data, auxData, metaData, txtData, weights] = mydata_Discus_rotundatus
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Discidae';
metaData.species    = 'Discus_rotundatus'; 
metaData.species_en = 'Round disk snail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thw'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biO'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 20]; 

%% set data
% zero-variate data

data.ab  = 20;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'Kuzn1999';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '14-36 d';
data.am  = 3.5*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'Kuzn1999';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.1; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'Kuzn1999';
data.Lp  = 0.6; units.Lp  = 'cm';  label.Lp  = 'shell breath at puberty';   bibkey.Lp  = 'Kuzn1999';
data.Li  = 0.65; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'Jans2015';

data.Wdi  = 5.2e-3; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Will1976';
  comment.Wdi = 'based on size-corrected value for Cepaea nemoralis: (0.65/2.2)^3*0.2';

data.Ni  = 178;   units.Ni  = '#'; label.Ni  = 'life time reproduction output';     bibkey.Ni  = 'Kuzn1999';   
  temp.Ni = C2K(21.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), number of whorls (#)
0	2.239
11	2.781
35	3.418
45	3.983
55	4.478
76	5.539
103	5.633
136	5.845
166	5.822
197	6.175
227	6.222
256	6.175
289	6.458
319	6.458
350	6.481
461	6.434
541	6.529
747	6.505
781	6.505
886	6.481
950	6.481
1044	6.434
1147	6.505];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kuzn1999';
comment.tL = 'based on # of whorls, assuming a constant factor per whorl, given Lb and Li';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ni = 5 * weights.Ni;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Kuzn1999'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DBFT'; % Cat of Life
metaData.links.id_ITIS = '77404'; % ITIS
metaData.links.id_EoL = '452530'; % Ency of Life
metaData.links.id_Wiki = 'Discus_rotundatus'; % Wikipedia
metaData.links.id_ADW = 'Discus_rotundatus'; % ADW
metaData.links.id_Taxo = '38720'; % Taxonomicon
metaData.links.id_WoRMS = '1050222'; % WoRMS
metaData.links.id_molluscabase = '1050222'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Discus_rotundatus}}';
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
bibkey = 'Kuzn1999'; type = 'Article'; bib = [ ... 
'author = {El\dot{z}bieta Ku\''{z}nik-{K}owalska}, ' ... 
'title = {LIFE CYCLE and population dynamics OF \emph{Discus rotundatus} ({O}. {F}. M\"{u}ller, 1774) ({G}ASTROPODA: {P}ULMONATA: {E}NDODONTIDAE)}, ' ...
'journal = {Folia Malacologica}, ' ...
'volume = {7}, ' ...
'year = {1999}, ' ...
'pages = {5-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1976'; type = 'Article'; bib = [ ... 
'author = {Phillip Williampson}, ' ... 
'title = {Size-weight relationships and field growth rates of the landsnail \emph{Cepaea nemoralis} {L}.}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'number = {3}, ' ...
'volume = {45}, ' ...
'year = {1976}, ' ...
'pages = {875-885}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jans2015'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Bert Jansen}, ' ...
'year = {2015}, ' ...
'title  = {Veldgids Slakken en Mossels}, ' ...
'publisher = {KNNV}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

