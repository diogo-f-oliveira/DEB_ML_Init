function [data, auxData, metaData, txtData, weights] = mydata_Perforatella_bidentata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Hygromiidae';
metaData.species    = 'Perforatella_bidentata'; 
metaData.species_en = 'Hairy snail'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thw'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
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

data.ab  = 15;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'KuznRoks2009';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '8-34 d';
data.am  = 3*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'KuznRoks2009';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.22; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'KuznRoks2009';
data.Lp  = 0.6; units.Lp  = 'cm';  label.Lp  = 'shell breath at puberty';   bibkey.Lp  = 'KuznRoks2009';
data.Li  = 0.7; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'EoL';

data.Wwi  = 0.178; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'EoL';

data.Ni  = 90;   units.Ni  = '#'; label.Ni  = 'life time reproduction output';     bibkey.Ni  = 'KuznRoks2009';   
  temp.Ni = C2K(21.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '2-20 eggs per clutch, up to 9 clutches per life time';
  
% uni-variate data
% time-length
data.tL = [ ... % age (d), number of whorls (#)
0	1.446
0	1.523
0	1.585
0	1.646
0	1.708
34	2.200
34	1.938
34	2.031
34	2.108
34	2.338
70	3.200
70	2.877
70	3.031
70	2.785
96	3.492
96	3.154
96	3.246
96	3.369
124	3.800
124	3.877
124	3.985
124	4.062
150	4.492
150	4.554
150	4.600
150	4.708
150	4.354
179	5.015
179	5.108
179	5.169
179	5.231
179	5.262
216	5.323
216	5.277
216	5.415
216	5.477
216	5.585
242	5.692
242	5.785
242	5.892
242	6.015
280	6.000
280	6.108
280	6.200
280	6.277
314	6.046
314	6.108
314	6.231
314	6.400
342	6.277
342	6.385
342	6.092
342	6.169];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KuznRoks2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
metaData.bibkey.F1 = 'KuznRoks2009'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6V4ZS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3007306'; % Ency of Life
metaData.links.id_Wiki = 'Perforatella_bidentata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW  not present 
metaData.links.id_Taxo = '1689014'; % Taxonomicon 
metaData.links.id_WoRMS = '292689'; % WoRMS
metaData.links.id_molluscabase = '292689'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perforatella_bidentata}}';
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
bibkey = 'KuznRoks2009'; type = 'Article'; bib = [ ... 
'author = {El\dot{z}bieta Ku\''{z}nik-{K}owalska and Aneta Roksela}, ' ... 
'title = {LIFE CYCLE OF \emph{Perforatella bidentata} ({G}MELIN, 1791) ({G}ASTROPODA: {P}ULMONATA: {H}ELICIDAE)}, ' ...
'journal = {Folia Malacologica}, ' ...
'volume = {17}, ' ...
'year = {2009}, ' ...
'pages = {199-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/3007306}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

