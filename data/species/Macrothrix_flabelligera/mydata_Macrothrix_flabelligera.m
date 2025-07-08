function [data, auxData, metaData, txtData, weights] = mydata_Macrothrix_flabelligera 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Macrothricidae';
metaData.species    = 'Macrothrix_flabelligera'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TPi','TN','TA'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-N'; 'L-Wd'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 12]; 

%% set data
% zero-variate data

data.ab = 35.9/24;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'GuntMats2003';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'GuntMats2003';   
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 27;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'GuntMats2003';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0311; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'GuntMats2003';
data.Lp  = 0.046; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'GuntMats2003';
data.Li  = 0.107;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'GuntMats2003';

data.Wdb  = 0.272; units.Wdb = 'mug'; label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'GuntMats2003';
data.Wdi  = 19.1;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'GuntMats2003';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
0.000	0.272
0.001	0.317
0.002	0.299
0.254	0.341
0.995	0.334
1.003	0.264
1.048	0.299
1.095	0.320
1.782	0.350
1.975	0.387
2.070	0.414
2.100	0.574
2.102	0.561
2.121	0.401
3.049	0.478
3.101	0.462
3.135	0.580
3.139	0.553
3.141	0.532
3.962	0.676
4.008	0.708
4.101	0.756
4.113	0.652
4.165	0.633
5.045	0.703
5.048	0.676
5.127	0.831
5.189	0.732
5.198	0.657
5.201	0.636
5.207	0.588
6.028	0.727
6.111	0.855
6.122	0.770
6.124	0.748
6.214	0.823
7.104	0.805
7.163	0.727
7.194	0.877
7.206	0.778
7.219	0.674
7.958	0.682
7.984	0.874
7.987	0.850
7.993	0.799
8.031	0.895
8.039	0.829
8.044	0.783
9.072	0.856
9.077	0.810
9.109	0.957
9.124	0.829
9.948	0.952
10.000	0.928
10.004	0.901
10.056	0.877
11.081	0.971
11.133	0.947
11.185	0.923
11.187	0.904
11.878	0.905
11.919	0.977
11.920	0.966
11.927	0.913
11.974	0.931
13.005	0.974
13.011	0.921
13.057	0.947
13.843	0.974
13.946	0.945
14.927	0.985
14.931	0.953
15.867	0.967
15.869	0.951
16.010	1.007
16.899	1.005
16.905	0.954
16.952	0.970
17.091	1.047
17.731	1.055
17.833	1.031
17.975	1.077
18.040	0.951
19.015	1.050
19.755	1.048
19.899	1.080
20.838	1.070
21.726	1.072
22.811	1.073
23.848	1.070
24.884	1.073
25.772	1.071];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(23); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GuntMats2003'; 
  
% length-weight
data.LWd = [ ... % length (mum), dry weight (mug)
295.426	3.416
313.191	3.730
325.547	4.854
325.627	3.955
373.677	3.865
409.217	4.404
449.782	8.449
450.050	5.438
456.991	7.416
507.097	4.225
526.494	6.202
540.781	5.618
688.112	9.618
711.280	9.213
727.342	8.674
736.071	10.562
796.649	9.663
799.772	14.562
812.132	15.640
817.694	13.124
824.999	11.011
878.184	13.213
881.411	16.944
888.748	14.472
921.040	11.506
923.911	19.236];
units.LWd  = {'mum', 'mug'};  label.LWd = {'length','dry weight'};  
bibkey.LWd = 'GuntMats2003'; 
    
% time-cum reprod
data.tN = [ ... % time (d), brood (#)
 3.5 5.004
 6   12.821
 8.5 14.953
11   17.496
13.5 18.464
16   19.568
18.5 19.851
21	 19.037
23.5 10.553];
data.tN(:,2) = cumsum(data.tN(:,2));
units.tN  = {'d', '#'};  label.tN = {'time since birth', 'cum number of eggs'};  
temp.tN   = C2K(23); units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'GuntMats2003';   
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = 'ab is ignored in estimation because of inconsistency with tL data; a delay in the onset of development might be present';
% metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3XBZL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46946720'; % Ency of Life
metaData.links.id_Wiki = 'Macrothrix'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5487256'; % Taxonomicon
metaData.links.id_WoRMS = '1302783'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Macrothrix}}';
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
bibkey = 'GuntMats2003'; type = 'Article'; bib = [ ... 
'doi = {10.1023/a:1023414612650}, ' ...
'author = {Adriana Maria G\"{u}ntze and Takako Matsumura-Tundisi and Odete Rocha}, ' ... 
'year = {2003}, ' ...
'title = {Life cycle of \emph{Macrothrix flabelligera} {S}mirnov, 1992 ({C}ladocera, {M}acrothricidae), recently reported in the {N}eotropical region}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {490(1-3)}, ' ...
'pages = {87–92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
