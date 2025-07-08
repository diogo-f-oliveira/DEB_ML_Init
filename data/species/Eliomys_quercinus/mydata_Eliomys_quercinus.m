function [data, auxData, metaData, txtData, weights] = mydata_Eliomys_quercinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Gliridae';
metaData.species    = 'Eliomys_quercinus'; 
metaData.species_en = 'Garden dormouse'; 

metaData.ecoCode.climate = {'BSk','Cfa','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiC','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 03]; 

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 2;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MoreColl1989';
  comment.Wwb = 'in lab, in wild till 2.5 g';
data.Wwi = 120;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = 'AnAge gives 82.5 g; ADW 45-120 g; Wiki 60-140 g; MoreColl1989 to 170 g';

data.Ri  = 1.2*5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.2 litter per yr, 5 pups per litter';

% uni-variate data

% time-weight data
data.tWw = [ ... % time since birth (d), weight (g)
11       6.3
17       9.1
21      11.4
25      13.1
29      14.4
24.918	27.710
25.499	23.935
26.044	26.575
26.648	18.649
27.715	27.891
27.750	21.665
28.822	30.153
29.687	25.622
31.352	28.071
33.605	25.612
35.293	24.099
42.713	48.231
43.881	39.549
46.385	42.184
47.754	47.652
50.883	38.588
51.099	50.097
53.907	48.392
54.496	43.107
57.535	50.081
57.846	44.608
60.378	42.149
71.387	75.140
72.061	54.761
72.917	51.929
75.095	62.678
83.866	45.675
87.785	45.476
104.658	80.717
113.111	70.507
117.867	70.872
129.575	78.956
141.637	73.831
146.953	74.007
157.283	78.509
169.515	93.006
189.810	66.918
190.946	64.085
197.859	78.973
206.245	80.650
215.279	66.476
221.183	61.744];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw  = C2K(37.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'MoreColl1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6F43Z'; % Cat of Life
metaData.links.id_ITIS = '584970 '; % ITIS
metaData.links.id_EoL = '327936'; % Ency of Life
metaData.links.id_Wiki = 'Eliomys_quercinus'; % Wikipedia
metaData.links.id_ADW = 'Eliomys_quercinus'; % ADW
metaData.links.id_Taxo = '63270'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12500031'; % MSW3
metaData.links.id_AnAge = 'Eliomys_quercinus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eliomys_quercinus}}';
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
bibkey = 'MoreColl1989'; type = 'Article'; bib = [ ... 
'author = {S. Moreno and E. Collado}, ' ... 
'year = {1989}, ' ...
'title = {Growth of the garden dormouse (\emph{Eliomys quercinus} {L}innaeus, 1766) in southwestern {S}pain}, ' ...
'journal = {Z. S\"{a}ugetierkunde}, ' ...
'volume = {54}, ' ...
'pages = {100-106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Eliomys_quercinus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Eliomys_quercinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
