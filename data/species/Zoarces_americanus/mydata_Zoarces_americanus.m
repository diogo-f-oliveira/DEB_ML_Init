function [data, auxData, metaData, txtData, weights] = mydata_Zoarces_americanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zoarcidae';
metaData.species    = 'Zoarces_americanus'; 
metaData.species_en = 'Ocean pout'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnf'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 07];

%% set data
% zero-variate data

data.ab = 2.75*30.5;      units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'Wiki';   
  temp.ab = C2K(3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '2-3 mnth';
data.am = 19*365;      units.am = 'd';    label.am = 'life span';        bibkey.am = 'Clem1920';   
  temp.am = C2K(3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 28.8;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 110;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0654;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Clem1920';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3';
data.Wwp = 87;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for female';  bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00186*Lp^3.20, see F1';
data.Wwi = 6.3e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00186*Li^3.20, see F1';

data.Ri  = 1805/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 62 cm';    bibkey.Ri  = 'Clem1920';   
  temp.Ri = C2K(3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [... % time (yr), total length (cm)
0.340	3.037
0.917	8.317
0.917	7.790
0.943	6.999
0.969	9.372
0.995	8.846
1.940	12.549
1.967	11.759
1.992	14.395
2.910	19.021
2.910	18.362
2.911	17.571
2.988	20.736
2.988	20.341
2.989	19.682
3.960	21.276
3.986	23.518
3.986	22.727
4.038	24.573
4.983	26.827
4.984	25.376
5.034	30.518
5.900	35.012
5.927	33.694
5.928	30.926
5.953	32.903
5.954	32.244
5.954	31.585
6.951	35.553
6.978	34.762
7.948	40.707
7.948	39.653
7.948	39.125
7.966	61.009
7.972	47.299
7.975	37.544
8.918	46.257
8.946	41.907
8.969	50.212
8.972	43.226
8.973	41.248
8.996	48.367
8.997	46.917
8.997	45.072
9.941	52.730
9.941	52.203
9.942	50.093
9.944	43.898
9.967	53.258
9.968	51.148
9.969	46.007
9.970	44.821
9.970	44.293
9.995	47.853
9.995	46.930
9.996	45.348
10.021	48.249
10.072	53.786
10.967	48.657
10.968	45.888
10.991	55.776
12.015	57.767
12.068	56.581
12.987	59.757
13.991	45.796
14.038	58.716
14.962	48.578
15.089	59.389
15.982	61.774
16.035	60.852
17.033	61.524
17.110	68.248
17.112	62.580
19.133	67.879]; 
data.tL(:,1) = (0 + data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Clem1920';

% length-weight
data.LW = [... % total length (cm), wet weight (ounzes)
21.170	1.147
25.824	1.793
30.972	3.878
35.150	6.066
39.042	8.928
43.037	12.943
46.167	18.118
49.299	23.773
52.337	29.909
55.077	34.797
58.498	40.066
60.368	45.343
62.332	50.044
64.202	55.225
66.264	60.213
68.423	65.105
69.516	70.002]; 
data.LW(:,2) = data.LW(:,2) * 28.35; % onvert ounze to g
units.LW   = {'cm', 'g'};  label.LW = {'total length','wet weight'};  
bibkey.LW = 'Clem1920';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

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
F1 = 'Length-Weight relationship: Ww in g = 0.00186*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5D67D'; % Cat of Life
metaData.links.id_ITIS = '165318'; % ITIS
metaData.links.id_EoL = '46575083'; % Ency of Life
metaData.links.id_Wiki = 'Zoarces_americanus'; % Wikipedia
metaData.links.id_ADW = 'Zoarces_americanus'; % ADW
metaData.links.id_Taxo = '190280'; % Taxonomicon
metaData.links.id_WoRMS = '159267'; % WoRMS
metaData.links.id_fishbase = 'Zoarces-americanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zoarces_americanus}}';
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
bibkey = 'Clem1920'; type = 'techreport'; bib = [ ... 
'author = {Wilbert A. Clemens}, ' ... 
'year = {1920}, ' ...
'title = {Contribution to the Biology of the Muttonfish, \emph{Zoarces anguillaris}}, ' ...
'institution = {Biological Board of Canada, Ottawa}, ' ...
'volume = {4}, ' ...
'series = {Histories of New Food Fishes}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Zoarces-americanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

