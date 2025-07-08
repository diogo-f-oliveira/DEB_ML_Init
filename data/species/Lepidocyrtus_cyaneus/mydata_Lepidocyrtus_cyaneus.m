function [data, auxData, metaData, txtData, weights] = mydata_Lepidocyrtus_cyaneus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Entognatha'; 
metaData.order      = 'Entomobryomorpha'; 
metaData.family     = 'Entomobryidae';
metaData.species    = 'Lepidocyrtus_cyaneus'; 
metaData.species_en = 'Springtail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biF'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 29]; 

%% set data
% zero-variate data

data.tj = 5;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'JoosVelt1970';   
  temp.tj = C2K(20); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'from inflection-point in tL data';
data.tp = 34;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JoosVelt1970';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 70;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoosVelt1970';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.045; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'JoosVelt1970';
data.Lp  = 0.093; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'JoosVelt1970';
data.Li  = 0.120;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'JoosVelt1970';

data.Wwb = 2.06e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on (Lb/Li)^3*Wwi';
data.Wwp = 1.82e-5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on (Lp/Li)^3*Wwi';
data.Wwi = 3.910e-5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Folsomia candida: (Li/0.238)^3 * 305 mug';

data.Ri  = .7*2.1;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on reprod investment of Folsomia candida: 19.5 * 1.695/ 305 * Wwi/ Wwb';

% uni-variate data
% time-length 
data.tL = [... time since birth (d), length (cm) 
0.329	0.045
6.026	0.057
8.074	0.060
12.402	0.068
16.729	0.076
18.071	0.068
19.007	0.080
19.914	0.080
22.200	0.088
22.871	0.084
23.760	0.076
24.695	0.088
28.334	0.093
29.447	0.083
29.468	0.093
30.817	0.087
30.837	0.096
34.003	0.092
35.149	0.098
37.178	0.092
39.465	0.100
44.461	0.103
46.947	0.099
51.504	0.108
56.492	0.108
57.353	0.087
59.886	0.104
62.598	0.100
65.573	0.112
71.043	0.123];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoosVelt1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3TBD8'; % Cat of Life
metaData.links.id_ITIS = '99805'; % ITIS
metaData.links.id_EoL = '346861'; % Ency of Life
metaData.links.id_Wiki = 'Lepidocyrtus_cyaneus'; % Wikipedia
metaData.links.id_ADW = 'Lepidocyrtus_cyaneus'; % ADW
metaData.links.id_Taxo = '102688'; % Taxonomicon
metaData.links.id_collembola = 'lepiinae.htm#Lepidocyrtus'; % collembola

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidocyrtus_cyaneus}}';
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
bibkey = 'JoosVelt1970'; type = 'Article'; bib = [ ... 
'author = {Joosse, E. and Veltkamp, E.}, ' ... 
'year = {1970}, ' ...
'title = {Some aspects of growth, moulting and reproduction in five species of surface dwelling collembola}, ' ...
'journal = {Neth. J. Zool.}, ' ...
'volume = {20}, ' ...
'pages = {315--328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
