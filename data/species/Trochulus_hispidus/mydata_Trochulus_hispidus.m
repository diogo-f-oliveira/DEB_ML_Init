function [data, auxData, metaData, txtData, weights] = mydata_Trochulus_hispidus
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Hygromiidae';
metaData.species    = 'Trochulus_hispidus'; 
metaData.species_en = 'Hairy snail'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wdi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 19]; 

%% set data
% zero-variate data

data.ab  = 8;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'ProcDrvo2013';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6-24 d';
data.tp  = 80;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'guess';   
  temp.tp = C2K(21.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am  = 250;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'ProcDrvo2013';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.10; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'ProcDrvo2013';
  comment.Lb = 'based on egg diameter of 1.31 - 1.75 mm';
data.Li  = 0.55; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'Jans2015';

data.Wdi  = 3.1e-3; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Will1976';
  comment.Wdi = 'based on size-corrected value for Cepaea nemoralis: (0.55/2.2)^3*0.2';

data.Ni  = 35;   units.Ni  = '#'; label.Ni  = 'life time reproduction output';     bibkey.Ni  = 'ProcDrvo2013';   
  temp.Ni = C2K(21.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '6-47';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), number of whorls (#)
0.000	1.534
30.687	1.910
60.815	2.436
89.828	3.224
117.725	3.488
149.528	3.839
177.425	3.953
213.133	4.130
239.914	4.444
271.159	4.421
299.056	4.697
331.974	4.874
360.987	4.925
390.000	5.351];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ProcDrvo2013';
comment.tL = 'Based on number of whorls, assuming a constant factor per whorl, given Lb and Li';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'ProcDrvo2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7CVZG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '452027'; % Ency of Life
metaData.links.id_Wiki = 'Trochulus_hispidus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW  not present 
metaData.links.id_Taxo = '1689058'; % Taxonomicon 
metaData.links.id_WoRMS = '1002493'; % WoRMS
metaData.links.id_molluscabase = '1002493'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trochulus_hispidus}}';
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
bibkey = 'ProcDrvo2013'; type = 'Article'; bib = [ ... 
'doi = {10.2478/s11756-012-0132-8}, ' ...
'author = {Ma{\l}gorzata Pro\''{c}k\''{o}w and Magda Drvotov\''{a} and Lucie Ju\v{r}i\v{c}kov\''{a} and El\dot{z}bieta Ku\''{z}nik-Kowalska}, ' ... 
'title = {Field and laboratory studies on the life-cycle, growth and feeding preference in the hairy snail \emph{Trochulus hispidus} ({L}., 1758) ({G}astropoda: {P}ulmonata: {H}ygromiidae)}, ' ...
'journal = {Biologia}, ' ...
'volume = {68}, ' ...
'year = {2013}, ' ...
'pages = {131-141}'];
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

