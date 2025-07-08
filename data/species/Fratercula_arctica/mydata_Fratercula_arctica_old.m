function [data, auxData, metaData, txtData, weights] = mydata_Fratercula_arctica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Fratercula_arctica'; 
metaData.species_en = 'Puffin'; 
metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 22]; 

%% set data
% zero-variate data

data.ab = 42;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(32);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 34;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'OyanAnke1996';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Between 34 and 74 d';
data.tR = 1460;        units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 40.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 41;         units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OyanAnke1996';
data.Wwi = 490.5;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.996	42.763
1.793	48.857
2.922	55.709
3.918	63.327
5.047	76.290
5.911	86.968
6.907	96.878
7.970	108.315
8.899	115.935
10.095	125.841
11.025	138.045
11.888	150.250
12.951	160.923
13.947	169.305
15.009	179.978
15.939	189.890
17.002	196.743
17.932	205.126
18.928	213.509
19.991	229.530
21.053	247.843
21.983	260.046
22.913	273.014
23.909	281.397
24.972	293.598
25.968	301.216
26.964	309.598
28.027	316.451
28.956	324.835
30.019	332.452
31.148	339.303
32.011	343.868
32.941	351.488
33.937	359.870
35.398	366.715
36.129	370.519
36.926	373.557
38.121	378.879];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'OyanAnke1996';
% t-W data, food restricted level 1
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.863	42.766
1.926	49.618
2.789	52.656
3.985	61.034
4.782	67.892
6.110	83.143
6.907	86.946
8.102	97.616
8.899	106.767
10.095	112.089
10.892	125.059
12.154	134.964
12.951	143.351
13.947	152.497
14.877	159.353
16.006	165.440
16.935	172.296
17.998	180.677
18.861	189.062
19.924	203.555
20.987	216.520
22.116	231.775
22.979	243.981
23.909	250.836
25.104	260.742
26.034	267.598
26.898	278.275
27.960	287.420
28.956	291.219
30.019	298.835
31.082	303.396
32.078	312.543
33.074	320.161
34.070	326.251
35.199	333.103
35.996	337.669
36.992	344.524
38.254	349.080];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(40.7);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'OyanAnke1996';
% t-W data, food restricted level 2
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.930	41.236
1.860	47.328
2.922	50.361
3.985	58.742
4.981	67.124
6.044	77.033
6.973	83.125
8.036	89.213
8.966	95.305
9.896	99.869
10.892	112.835
11.954	120.452
12.951	128.070
14.013	135.687
15.076	142.540
15.873	147.107
17.002	153.958
18.065	159.283
19.127	165.372
20.123	181.394
21.053	192.834
22.049	202.745
23.112	214.181
24.042	221.801
24.972	230.185
26.034	238.566
27.030	246.184
28.027	250.746
29.089	256.071
29.953	261.401
31.148	269.014
32.144	272.049
33.074	278.141
34.070	283.467
35.066	290.321
36.129	294.118
37.059	300.210
37.989	304.773];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(40.7);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'OyanAnke1996';
% t-W data, food restricted level 3
data.tW3 = [ ... % time since birth (d), wet weight (g)
1.063	41.997
2.125	47.322
3.188	51.119
4.118	52.627
5.114	56.425
6.110	64.043
7.173	67.840
7.970	73.171
9.032	76.204
9.896	83.061
10.958	91.442
12.021	98.294
13.083	105.147
14.080	113.530
15.009	118.093
16.006	122.656
17.068	126.453
18.065	130.251
19.061	137.105
19.924	143.962
20.987	156.163
21.917	163.783
23.046	173.690
24.042	182.837
25.171	189.688
25.968	197.311
27.097	204.926
27.960	207.964
29.023	214.052
29.953	218.616
31.015	223.177
31.945	227.741
33.008	230.010
34.070	237.626
35.133	239.895
35.930	243.698
37.125	247.492
37.989	250.529];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(40.7);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'OyanAnke1996';
% t-W data, food restricted level 4
data.tW4 = [ ... % time since birth (d), wet weight (g)
0.996	43.527
2.125	44.266
3.055	45.010
3.985	46.517
5.047	48.786
5.844	51.825
7.040	58.675
8.036	63.237
8.966	64.745
10.028	68.542
11.025	73.868
11.954	79.196
13.017	85.285
13.880	89.850
14.943	92.883
15.939	97.445
17.002	101.242
17.932	105.042
19.061	108.073
19.924	114.166
20.987	120.255
22.049	123.288
22.913	129.381
23.975	134.706
24.972	140.032
26.034	144.593
27.894	152.192
30.085	159.021
31.945	165.092
34.004	171.923
36.129	174.933
37.989	180.240];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4    = C2K(40.7);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'OyanAnke1996';
% t-W data, food restricted level 5
data.tW5 = [ ... % time since birth (d), wet weight (g)
0.996	40.471
1.992	41.977
2.989	43.483
4.051	44.224
5.047	47.258
6.044	49.529
7.106	50.269
8.036	52.541
9.231	57.099
10.028	59.374
10.958	62.409
12.021	66.970
12.951	66.950
13.880	69.222
14.943	70.726
16.139	72.228
17.002	72.210
18.065	73.714
18.861	75.989
20.057	80.547
20.920	85.112
21.917	88.910
22.846	93.474
23.975	99.562
24.972	104.124
26.034	110.213
27.030	111.719
28.159	113.986
29.156	116.257
30.152	116.999
30.949	119.273
31.879	121.545
33.207	125.336
33.871	128.378
35.266	128.347
36.195	129.855
37.059	133.656
38.121	134.397];
units.tW5   = {'d', 'g'};  label.tW5 = {'time since birth', 'wet weight'};  
temp.tW5    = C2K(40.7);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5  = 'OyanAnke1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;
weights.Wwi = 10 * weights.Wwi;
weights.Wwb = 10 * weights.Wwb;
weights.Ri = 10 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1','tW2','tW3','tW4','tW5'}; comment1 = {'Data for different feeding levels'};
metaData.grp.sets = {set1};
metaData.grp.comment = {comment1};

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Atlantic_puffin}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Fratercula_arctica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NettBirk1985'; type = 'Book'; bib = [ ...  
'title = {The Atlantic Alcidae. The evolution, distribution and biology of the auks inhabiting the Atlantic Ocean and adjacent water areas.}, ' ...
'publisher = {Academic Press}, ' ...
'year = {1985}, ' ...
'author = {Nettleship, D. N. and Birkhead, T. R.}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OyanAnke1996'; type = 'Article'; bib = [ ...  
'title = {ALLOCATION OF GROWTH IN FOOD-STRESSED ATLANTIC PUFFIN CHICKS}, ' ...
'journal = {The Auk}, ' ...
'volume = {113}, ' ...
'pages = {830--841}, ' ...
'year = {1996}, ' ...
'author = {H. S. {\O}yan and T. Anker-Nilssen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

