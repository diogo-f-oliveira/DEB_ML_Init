function [data, auxData, metaData, txtData, weights] = mydata_Cyclothone_atraria
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Gonostomatidae';
metaData.species    = 'Cyclothone_atraria'; 
metaData.species_en = 'Deep-water bristlemouth'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.3); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 01];

%% set data
% zero-variate data
data.am = 9*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'MiyaNemo1987';  
  temp.am = C2K(9.3); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tp of 5-6 yr, and several spawnings per life cycle';

data.Lp = 3.6;   units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'MiyaNemo1987';
data.Li = 6.2;   units.Li = 'cm';   label.Li = 'ultimate std length';    bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MiyaNemo1987';
  comment.Wwb = 'based on egg diameter of 0.3 mm: pi/6*0.03^3';
data.Wwp = 0.18; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00389*Lp^2.99, see F1';  
data.Wwi = 0.91;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00389*Li^2.99, see F1';  

% uni-variate data
% time-length
data.tL = [ ... % time  (d) - std length (cm)
18.389	1.379
81.916	1.573
112.008	1.660
138.756	1.670
170.519	1.703
198.939	1.854
264.137	1.875
324.321	1.864
356.084	1.863
474.779	2.209
563.382	2.360
621.893	2.468
747.275	2.467
896.061	2.823
926.153	2.877
959.588	2.876
1079.954	2.940]; 
data.tL(:,1) = 300 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(9.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MiyaNemo1987';

% length-fecundity
data.LN = [ ... % std length (cm), fecudity (#)
3.672	460.062
3.705	611.259
3.777	1126.915
3.829	1188.557
3.856	706.755
3.928	871.500
3.983	1105.139
3.995	843.605
4.009	1029.311
4.035	1132.378
4.043	891.504
4.066	801.932
4.099	1145.785
4.125	1372.704
4.166	1104.130
4.276	1227.379
4.321	1240.892
4.331	1116.988
4.395	1123.514
4.399	1309.273
4.452	903.016
4.485	1226.228
4.500	1735.322
4.538	1487.408
4.574	1927.572
4.576	1390.866
4.587	1865.575
4.593	1624.719
4.619	1741.547
4.623	1892.903
4.639	2009.785
4.699	1486.522
4.722	1926.757
4.727	2222.606
4.738	1747.773
4.764	1967.811
4.785	1300.267
4.789	1644.280
4.813	2070.754
4.827	2352.788
4.938	3026.486
4.947	1836.070
4.993	2874.812
5.006	1904.557
5.066	1704.683
5.099	1862.759
5.147	2915.245
5.168	2405.956
5.169	2598.613
5.183	3018.260
5.228	1972.141
5.279	2880.116
5.335	2274.303
5.345	2322.415
5.511	2018.747
5.520	2651.728
5.692	3159.954
5.822	2636.301];    
units.LN = {'cm', '#'}; label.LN = {'std length', 'fecundity'};  
temp.LN = C2K(9.3);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MiyaNemo1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lp = 2 * weights.Lp;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BTLS'; % Cat of Life
metaData.links.id_ITIS = '162165'; % ITIS
metaData.links.id_EoL = '46563207'; % Ency of Life
metaData.links.id_Wiki = 'Cyclothone_atraria'; % Wikipedia
metaData.links.id_ADW = 'Cyclothone_atraria'; % ADW
metaData.links.id_Taxo = '172513'; % Taxonomicon
metaData.links.id_WoRMS = '274943'; % WoRMS
metaData.links.id_fishbase = 'Cyclothone-atraria'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclothone_atraria}}';
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
bibkey = 'MiyaNemo1987'; type = 'article'; bib = [ ...
'doi = {10.1016/0198-0149(87)90109-9}, ' ...
'author = {Miya, M. and Nemoto, T. }, ' ... 
'year   = {1987}, ' ...
'title  = {Reproduction, growth and vertical distribution of the meso- and bathypelagic fish \emph{Cyclothone atraria} ({P}isces: {G}onostomatidae) in {S}agami {B}ay, {C}entral {J}apan}, ' ...
'journal = {Deep Sea Research Part A. Oceanographic Research Papers}, ' ...
'page = {1565–1577}, ' ...
'volume = {34(9)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Cyclothone-atraria.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

