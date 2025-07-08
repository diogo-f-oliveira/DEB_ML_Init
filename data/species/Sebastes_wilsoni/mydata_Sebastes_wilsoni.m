function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_wilsoni

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_wilsoni'; 
metaData.species_en = 'Pygmy rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 27];

%% set data
% zero-variate data

data.am = 26*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(6.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 23;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 12.3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on based on 0.01000*Lp^3.09';
data.Wwi = 161;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 1.9e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(6.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_hopkinsi: 39e3*(23/29)^3';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
40.520	0.846
44.007	0.953
45.122	0.784
47.525	0.811
47.942	0.971
50.997	1.033
53.609	1.140
54.709	1.086
58.444	0.953
58.864	1.095
59.928	1.335
60.834	1.086
61.707	1.104
62.783	1.246
67.162	1.211
69.320	1.451
69.938	1.753
70.203	1.388
70.898	1.077
71.322	1.184
71.488	1.602
71.524	1.317
71.968	1.264
73.050	1.362
73.443	1.717
74.166	1.184
74.342	1.522
75.198	1.673
75.385	1.930
76.768	1.362
78.070	1.451
79.814	1.495
81.529	1.779
81.710	2.081
81.735	1.877
81.755	1.717
81.913	2.206
83.056	1.815
83.911	1.975
90.641	2.383
90.698	1.921
92.165	2.437
96.303	2.588
99.828	2.383
105.259	2.685
105.874	3.014
109.412	2.712
111.133	2.943
121.192	2.970
125.134	2.934
125.331	3.112
129.711	3.067
134.734	3.138
139.290	3.440
144.801	3.103];
data.tL(:,2) = 1.16*data.tL(:,2); % convert SL to TL, see F2
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(6.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LaidSaku2004';  

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 1.16 * SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4W7KY'; % Cat of Life
metaData.links.id_ITIS = '166709'; % ITIS
metaData.links.id_EoL = '46568120'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_umbrosus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_umbrosus'; % ADW
metaData.links.id_Taxo = '187252'; % Taxonomicon
metaData.links.id_WoRMS = '274774'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-umbrosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_umbrosus}}';
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
bibkey = 'LaidSaku2004'; type = 'article'; bib = [ ... 
'author = {Thomas E. Laidig and Keith M. Sakuma and Jason A. Stannard},' ...
'year = {2004}, ' ...
'title = {Description and growth of larval and pelagic juvenile pygmy rockfish (\emph{Sebastes wilsoni}) (family {S}ebastidae)}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {102}, ' ...
'pages = {452–463}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-umbrosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
