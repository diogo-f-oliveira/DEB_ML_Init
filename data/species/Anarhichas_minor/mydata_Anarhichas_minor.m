function [data, auxData, metaData, txtData, weights] = mydata_Anarhichas_minor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anarhichadidae';
metaData.species    = 'Anarhichas_minor'; 
metaData.species_en = 'Spotted wolffish'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MN', 'MAN'};
metaData.ecoCode.habitat = {'0bMcb', 'bpMp', 'piMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.5); % K
metaData.data_0     = {'ab';  'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm  = [2019 03 06];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 03 06]; 

%% set data
% zero-variate data

data.ab = 10*30;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ShevJoha2011';   
  temp.ab = C2K(3.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'pp. 331 says that incubation time for all three wolf fish species is 9-10 months';
data.ap = 7*365;    units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Wiki';
  temp.ap = C2K(3.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'females mature at 6-8 years or more';
data.am = 21*365;    units.am = 'd';    label.am = 'life span';     bibkey.am = 'Wiki';   
  temp.am = C2K(3.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 2.25;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'fishbase';
data.Lp  = 55;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
 comment.Lp = '50 to 60 cm';
data.Li  = 180;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-2;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 5.5 mm: pi/6*0.55^3';
data.Wwp = 796;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 27.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';  

data.Ri  = 35200/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(3.5);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW12 = [ ... time(d), weight (g)
0.211	118.266
32.284	150.630
63.092	213.111
88.413	241.942
139.899	309.417
161.211	341.734];
units.tW12   = {'d', 'g'};  label.tW12 = {'time since birth', 'wet weight', '12 C'};  
temp.tW12    = C2K(12);  units.temp.tW12 = 'K'; label.temp.tW12 = 'temperature';
bibkey.tW12 = 'ImslFoss2006'; 
comment.tW12 = 'Data for 12 C';
%
data.tW8 = [ ... time(d), weight (g)
0.211	110.560
32.706	166.043
63.725	230.626
87.991	269.961
139.899	368.961
161.211	401.278];
units.tW8   = {'d', 'g'};  label.tW8 = {'time since birth', 'wet weight', '8 C'};  
temp.tW8    = C2K(8);  units.temp.tW8 = 'K'; label.temp.tW8 = 'temperature';
bibkey.tW8 = 'ImslFoss2006'; 
comment.tW8 = 'Data for 8 C';
%
data.tW6 = [ ... time(d), weight (g)
0.211	107.058
32.495	146.428
62.670	222.216
87.780	281.169
140.321	404.690
161.633	446.114];
units.tW6   = {'d', 'g'};  label.tW6 = {'time since birth', 'wet weight', '6 C'};  
temp.tW6    = C2K(6);  units.temp.tW6 = 'K'; label.temp.tW6 = 'temperature';
bibkey.tW6 = 'ImslFoss2006'; 
comment.tW6 = 'Data for 6 C';
%
data.tW4 = [ ... time(d), weight (g)
0.211	107.058
32.073	154.832
63.514	211.711
87.991	252.448
140.321	326.231
161.422	357.146];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight', '4 C'};  
temp.tW4    = C2K(4);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'ImslFoss2006'; 
comment.tW4 = 'Data for 4 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tW12 = 3 * weights.tW12;
weights.tW8 = 3 * weights.tW8;
weights.tW6 = 3 * weights.tW6;
weights.tW4 = 3 * weights.tW4;
weights.Wwi = 4 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW12','tW8','tW6','tW4'}; subtitle1 = {'Data for 12, 8, 6, 4C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'DGB9'; % Cat of Life
metaData.links.id_ITIS = '171342'; % ITIS
metaData.links.id_EoL = '46574578'; % Ency of Life
metaData.links.id_Wiki = 'Anarhichas_minor'; % Wikipedia
metaData.links.id_ADW = 'Anarhichas_minor'; % ADW
metaData.links.id_Taxo = '46469'; % Taxonomicon
metaData.links.id_WoRMS = '126759'; % WoRMS
metaData.links.id_fishbase = 'Anarhichas-minor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Anarhichas_minor}}';
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
bibkey = 'ShevJoha2011'; type = 'incollection'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Shevelev, M. S. and Johannesen, E.}, ' ...
'year = {2011}, ' ...
'title  = {Wolfish}, ' ...
'chapter     = {5.10},'...
'booktitle  = {Wolfish}, ' ...
'editor  = {Jakobsen, T. and Ozhigin, V. K.}, ' ...
'publisher = {The Barents Sea. Ecosystem, Resources, Managment. {H}alf a century of {R}ussian-{N}orwegian cooperation}, ' ...
'pages = {329--337}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ImslFoss2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2005.00989.x}, ' ...
'author = {A. K. Imsland and A. Foss and L. O. Sparboe and S. Sigurdsson}, ' ... 
'year = {2006}, ' ...
'title = {The effect of temperature and fish size on growth and feed efficiency ratio of juvenile spotted wolffish \emph{Anarhichas minor}}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {68}, ' ...
'pages = {1107-1122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Anarhichas-minor.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
