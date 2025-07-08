function [data, auxData, metaData, txtData, weights] = mydata_Leptodactylus_fuscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Leptodactylidae';
metaData.species    = 'Leptodactylus_fuscus'; 
metaData.species_en = 'Rufous frog'; 

metaData.ecoCode.climate = {'Am', 'Af', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tntm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 28]; 

%% set data
% zero-variate data

data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess';
data.Li  = 5.6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'EoL';
data.Lim = 5.3;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'EoL';

data.Wwb = 6.54e-2; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3';
data.Wwi = 27.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected Pelobates fuscus: (5.6/6)^3*34';

data.Ri  = 200/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time (d), SVL (cm)
0.715	1.434
4.729	1.501
7.518	1.507
12.003	1.552
16.024	1.591
18.949	1.672
21.403	1.775
25.897	1.780
28.990	1.811
32.860	1.836
35.490	1.856
39.834	1.845
42.774	1.867
46.649	1.870
49.597	1.864
53.780	1.875
57.033	1.887
60.901	1.914
65.705	1.926
69.568	1.976
76.527	2.043
83.657	2.051
90.308	2.113];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'SVL'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'WalsDown2005';
comment.tL = 'shelter available'; 

% time-weight
data.tW = [ ... % time (d), wet weight (g)
1.211	0.194
5.348	0.213
8.563	0.251
11.933	0.269
15.603	0.383
19.276	0.454
21.874	0.548
25.855	0.591
28.609	0.648
32.743	0.704
35.808	0.704
39.948	0.675
42.857	0.713
46.842	0.708
49.908	0.698
53.586	0.703
57.109	0.726
60.931	0.854
66.143	0.830
69.502	0.996
76.392	1.081
83.897	1.142
90.627	1.312];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'WalsDown2005';
comment.tW = 'shelter available'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males dig a burrow and make foam nest in it'; 
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TN4S'; % Cat of Life
metaData.links.id_ITIS = '207731'; % ITIS
metaData.links.id_EoL = '1025412'; % Ency of Life
metaData.links.id_Wiki = 'Leptodactylus_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Leptodactylus_fuscus'; % ADW
metaData.links.id_Taxo = '140887'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Leptodactylus+fuscus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptodactylus_fuscus}}';
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
bibkey = 'WalsDown2005'; type = 'Article'; bib = [ ...  
'author = {Patrick T. Walsh and J. Roger Downie}, ' ...
'year = {2005}, ' ...
'title  = {THE EFFECTS OF SHELTER AVAILABILITY AND SUBSTRATE QUALITY ON BEHAVIOUR AND POST-METAMORPHIC GROWTH IN THREE SPECIES OF ANURANS: IMPLICATIONS FOR CAPTIVE BREEDING}, ' ...
'journal = {Herpetological Journal}, ' ...
'volme = {15}, ' ...
'pages = {245-255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Leptodactylus&where-species=fuscus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1025412/articles}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

