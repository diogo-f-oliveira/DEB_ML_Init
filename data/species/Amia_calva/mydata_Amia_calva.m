function [data, auxData, metaData, txtData, weights] = mydata_Amia_calva

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Amiiformes'; 
metaData.family     = 'Amiidae';
metaData.species    = 'Amia_calva'; 
metaData.species_en = 'Bowfin'; 

metaData.ecoCode.climate = {'Dfa', 'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temperature
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2014 04 17];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data
data.ah = 9; units.ah = 'd';  label.ah = 'age at hatch';                   bibkey.ah = 'flmnh';    
  temp.ah = C2K(18); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 18; units.ab = 'd';  label.ab = 'age at birth';                  bibkey.ab = 'flmnh';    
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 3*365;   units.ap = 'd';  label.ap = 'age at puberty';           bibkey.ap = 'EtniStar1993';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 12*365;  units.am = 'd';  label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.8;   units.Lh = 'cm'; label.Lh = 'total length at hatch';      bibkey.Lh = 'flmnh';
data.Lb = 1.2;   units.Lb = 'cm'; label.Lb = 'total length at birth';      bibkey.Lb = 'flmnh';
data.L365 = 20.3;units.L365 = 'cm'; label.L365 = 'total length at 365d';   bibkey.L365 = 'flmnh';
  temp.L365 = C2K(15);  units.temp.L365 = 'K'; label.temp.L365 = 'temperature';
data.Lp = 60;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'ADW';
  comment.Lp = 'for female; 45 cm for male';
data.Li = 75;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'flmnh';
  comment.Li = 'for female; males max 18-24 cm SL or 45.7-61.0 cm TL';

data.Wwi = 3800; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'flmnh';

data.Ri = 64000/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';  bibkey.Ri  = 'flmnh';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

%  t-L data from  Virfish >2007 for Nottoway & Blackwater River
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
data.tL = [ ...
1085.347	46.770
1085.428	45.635
1097.064	43.177
1090.996	47.905
1148.526	44.693
1131.051	48.664
1464.229	36.955
1464.121	38.468
1458.269	40.170
1458.188	41.305
1458.106	42.439
1457.998	43.952
1469.390	44.899
1463.579	46.033
1463.511	46.979
1463.443	47.924
1457.632	49.059
1457.578	49.815
1457.537	50.383
1457.429	51.896
1498.433	39.415
1492.581	41.117
1498.162	43.198
1498.094	44.144
1498.026	45.089
1509.378	46.603
1497.810	48.115
1503.472	49.061
1503.431	49.628
1503.377	50.385
1497.593	51.141
1497.539	51.898
1491.687	53.599
1491.592	54.923
1502.930	56.626
1829.822	52.671
1835.376	55.130
1829.592	55.886
1823.822	56.454
1823.781	57.021
1823.618	59.290
1869.878	53.430
1869.756	55.132
1869.702	55.889
1863.918	56.645
1875.283	57.969
1863.742	59.103
2190.715	54.014
2184.538	60.255
2225.081	54.205
2224.851	57.420
2224.662	60.068
2230.094	64.229
2229.863	67.444
2539.742	61.030
2539.539	63.867
2545.025	67.271
2591.691	55.737
2591.582	57.250
2585.405	63.491
2602.392	66.328
2602.365	66.707
2602.297	67.652
2590.336	74.649
2912.311	59.347
2912.108	62.184
2911.837	65.966
2957.894	62.943
2951.798	68.049
3278.623	65.040
3278.419	67.876
3266.770	70.524]; % cm, physical length at f and T
data.tL(:,1) = data.tL(:,1) - data.tL(1,1);
temp.tL = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Virfish'; 
comment.tL = 'temp is guessed';


%  L-W data from  Virfish >2007 for Blackwater River
data.LW =[ ... % total length (cm), wet weight (g)
36.126	448.866
37.198	448.993
38.270	468.039
39.770	515.513
41.054	610.260
41.589	638.701
42.768	648.300
42.338	705.006
42.121	780.656
43.088	714.554
44.053	724.128
44.265	809.288
44.692	856.636
45.441	913.481
47.157	913.684
47.482	819.128
45.446	771.590
48.764	961.171
49.298	1046.370
49.403	1122.058
47.901	1121.880
50.695	942.481
52.089	952.105
51.654	1141.243
52.831	1217.058
52.398	1358.898
53.686	1321.213
54.967	1501.094
55.184	1444.363
56.257	1397.193
60.013	1312.502
56.786	1662.120
58.714	1728.564
58.925	1823.184
60.963	1823.425
61.703	2182.972
63.306	2362.891
64.273	2287.330
65.666	2334.792
66.943	2647.105
69.932	3092.053];
units.LW = {'cm', 'g'};   label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Virfish';

%% set weights for all real data
weights = setweights(data, []);
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'air breather at >18C';
metaData.bibkey.F1 = 'flmnh';
F2 = 'bowfin is host to glochidia larvae of the mollusk Megalonaias gigantea.' ;
metaData.bibkey.F2 = 'flmnh';
F3 = 'After fertilization, the eggs develop within the gill tubes into the tiny glochidia larvae.' ;
metaData.bibkey.F3 = 'flmnh';
F4 = 'The hatchlings have an adhesive organ on the tip of their snout that attaches them to the nest.';
metaData.bibkey.F4 = 'flmnh';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4); 

%% Links
metaData.links.id_CoL = 'CRZ7'; % Cat of Life
metaData.links.id_ITIS = '161104'; % ITIS
metaData.links.id_EoL = '223782'; % Ency of Life
metaData.links.id_Wiki = 'Amia_calva'; % Wikipedia
metaData.links.id_ADW = 'Amia_calva'; % ADW
metaData.links.id_Taxo = '42482'; % Taxonomicon
metaData.links.id_WoRMS = '157877'; % WoRMS
metaData.links.id_fishbase = 'Amia-calva'; % fishbase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Amia_calva/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EtniStar1993'; type = 'Book'; bib = [ ...
'author = {Etnier, David A. and Wayne C. Starnes}, ' ...   
'year = {1993}, ' ... 
'title = {The Fishes of Tennessee}, ' ...
'publisher = {The University of Tennessee Press. Knoxville}, ' ...
'howpublished = {\url{http://campus.murraystate.edu/academic/faculty/tderting/anatomyatlas/bowfinatlas2/homepage.htm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Virfish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.dgif.virginia.gov/fishing/waterbodies/reports/Bowfin Age & Growth Rpt .pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flmnh'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/fish/Gallery/Descript/Bowfin/Bowfin.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amia_calva}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

