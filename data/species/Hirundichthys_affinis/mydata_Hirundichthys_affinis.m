function [data, auxData, metaData, txtData, weights] = mydata_Hirundichthys_affinis 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Exocoetidae';
metaData.species    = 'Hirundichthys_affinis'; 
metaData.species_en = 'Fourwing flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 18];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 120;     units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'OxenHunt1994';
  temp.ap = C2K(28);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'Read from tL-curve, given Lp';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.80;   units.Lb  = 'cm';  label.Lb  = 'fork length at birth';    bibkey.Lb  = 'OxenHunt1994';  
data.Lp  = 20.9;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'OxenHunt1994'; 
data.Li  = 30.0;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwi = 324;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fisfbase';
  comment.Wwi = 'read from LW-curve, given Li';

data.Ri = 1.5e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'CasaRoss2005';   
temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'read from LN-curve for SL = 24 cm';
 
% uni-variate data
% t-L data
data.tL = [... % time since birth (d), fork length (cm)
11.437	2.088
12.960	2.413
17.513	2.923
23.553	2.645
20.544	3.155
18.285	3.433
18.288	3.525
22.068	3.526
22.073	3.665
22.080	3.896
24.341	3.665
27.363	3.573
28.881	3.758
19.064	4.174
22.839	3.989
22.845	4.174
25.870	4.175
25.119	4.360
24.376	4.777
22.864	4.777
34.189	4.222
32.682	4.407
29.656	4.360
29.663	4.592
33.444	4.593
32.694	4.778
31.182	4.778
28.163	4.963
25.899	5.101
25.905	5.287
28.177	5.426
28.929	5.287
37.994	5.010
38.001	5.242
34.221	5.241
34.228	5.473
41.035	5.520
37.256	5.566
34.989	5.612
29.696	5.611
29.700	5.750
28.950	5.936
30.466	6.075
30.475	6.353
34.246	6.029
39.534	5.891
42.562	5.984
44.083	6.262
41.814	6.262
38.791	6.307
37.288	6.585
35.021	6.631
36.543	6.956
40.321	6.864
46.366	6.725
47.125	6.818
44.861	6.957
43.353	7.096
41.087	7.188
39.579	7.327
39.588	7.605
55.434	6.541
53.954	7.560
48.658	7.467
43.365	7.466
44.128	7.698
44.129	7.744
41.106	7.790
38.092	8.114
38.858	8.439
43.401	8.625
41.134	8.671
44.138	8.022
50.186	7.977
64.540	7.561
56.238	8.070
53.972	8.163
49.440	8.301
49.449	8.579
54.739	8.487
56.256	8.626
61.553	8.766
51.727	8.904
53.247	9.135
55.521	9.321
59.299	9.229
61.568	9.229
61.575	9.461
60.826	9.692
61.579	9.600
56.289	9.692
51.746	9.506
49.487	9.784
49.495	10.062
55.537	9.831
46.531	11.961
55.542	9.970
59.328	10.155
61.597	10.156
63.871	10.341
60.095	10.480
68.396	9.971
70.682	10.527
62.378	10.943
66.926	11.315
70.713	11.500
76.772	11.825
81.293	11.316
85.817	10.900
88.152	13.031
80.585	12.845
77.562	12.891
77.578	13.401
110.113	14.053
113.139	14.100
197.267	20.318
212.411	21.015
242.679	21.713
257.036	21.391
272.951	22.551
303.946	22.323
319.059	22.000
334.958	22.651
365.207	22.747
394.701	22.889];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OxenHunt1994';

% L-W data
% L-N data for Cheilopogon melanurus from CasaRoss2005
%  (another species of flyingfish of almost similar length)
data.LN = [ ... % standard length (cm), fecundity (#)
17.814	3791.540
19.263	10415.224
19.487	6794.648
20.294	17114.905
19.791	20024.988
20.097	7664.793
20.114	5460.175
20.498	7667.422
20.498	8533.567
20.742	8535.167
20.588	13022.344
20.728	13968.144
21.111	13734.437
21.320	13814.549
21.199	14837.375
21.339	16098.136
21.619	18068.476
21.464	22240.692
21.266	10034.664
21.300	9404.969
21.544	9406.569
21.753	9014.238
21.770	9565.535
21.317	8538.938
21.542	5863.248
22.673	4689.570
22.500	6893.160
22.675	7602.966
22.572	9492.052
22.555	10436.823
22.556	12011.632
22.591	12641.784
22.278	14293.277
22.472	17995.335
22.145	24764.843
22.268	25946.750
23.086	24849.755
22.962	22486.741
23.170	20913.304
22.956	11541.818
23.444	12411.163
23.566	12490.703
23.688	12727.725
23.289	14614.867
23.481	15482.269
23.711	22649.136
23.609	25719.329
24.164	22022.184
25.665	28488.730
24.176	12967.146
24.560	14072.026
25.291	12816.979
24.782	7774.276
24.244	10132.946
23.965	9264.973];
units.LN = {'cm', '#'};     label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CasaRoss2005';
comment.LN = 'Data for Cheilopogon melanurus (another species of flyingfish of almost similar length)'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Fecundity is assumed to equal that of Cheilopogon melanurus';
D2 = 'shape coefficient for fork length is assumed 0.95 * that for standard length';
D3 = 'Li is given more weight to assure a proper max length';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'wet weight (g) = 0.01160 * (FL in cm)^3.010';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3M4QG'; % Cat of Life
metaData.links.id_ITIS = '165516'; % ITIS
metaData.links.id_EoL = '46566951'; % Ency of Life
metaData.links.id_Wiki = 'Hirundichthys'; % Wikipedia
metaData.links.id_ADW = 'Hirundichthys_affinis'; % ADW
metaData.links.id_Taxo = '176743'; % Taxonomicon
metaData.links.id_WoRMS = '159265'; % WoRMS
metaData.links.id_fishbase = 'Hirundichthys-affinis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hirundichthys}}'];
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
bibkey = 'LewiBrun1962'; type = 'Article'; bib = [ ... 
'author = {Lewis, J. B. and Brundritt, J. K. and Fish, A. G.}, ' ... 
'year = {1962}, ' ...
'title = {The Biology of the Flyingfish \emph{Hirundichthys affinis} (G\"{u}nther)}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'volume = {12}, ' ...
'number = {1}, '...
'pages = {73-94(22)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OxenHunt1994'; type = 'Article'; bib = [ ... 
'author = {H. A. Oxenford and W. Hunte and R. Deane  and S. E. Campana}, ' ... 
'year = {1994}, ' ...
'title = {Otolith age validation and growth-rate variation in flyingfish (\emph{Hirundichthys affinis}) from the eastern {C}aribbean}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {118}, ' ...
'pages = {585--592}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CasaRoss2005'; type = 'Misc'; bib = [ ... 
'author = {T. L. Casazza and S. W. Ross and A. M. Necaise and K. J. Sulak}, ' ... 
'year = {2005}, ' ...
'title = {Reproduction and Mating Behavior of \emph{Cheilopogon melanurus} off {N}orth {C}arolina}, ' ...
'howpublished = {\url{http://fl.biology.usgs.gov/posters/Coastal_Ecology/Cheilopogon_melanurus/cheilopogon_melanurus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hirundichthys-affinis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

