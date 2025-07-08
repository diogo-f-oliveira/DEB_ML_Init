function [data, auxData, metaData, txtData, weights] = mydata_Mobula_japanica
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Mobula_japanica'; 
metaData.species_en = 'Spinetail mobula'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 09 15];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 15]; 

%% set data
% zero-variate data;
data.ab = 365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'RambLamo2018';    
  temp.ab = C2K(27.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'PardKind2016';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'between 15 and 20 yrs';

data.Lb = 100;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'RambLamo2018';
  comment.Lb = 'Wiki: width 85 - 92 cm';
data.Lp = 218;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'RambLamo2018'; 
  comment.Lp = 'for females';
data.Li  = 310;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase'; 
  comment.Li = 'Wiki: for females, width: 9 m';

data.Ri  = 0.3/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'RambLamo2018';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'gestation 1 yr, pregnacy interval 2 - 5 yr';
  
% univariate data
% time - length
data.tL = [ ... % time since birth (yr), disc width (cm)
0.990	139.345
0.990	121.209
1.949	178.184
1.979	166.598
1.979	128.311
1.979	125.289
2.009	109.673
2.969	178.739
2.969	174.205
2.969	163.626
2.969	158.084
2.999	142.468
3.958	189.872
3.958	184.330
3.958	182.819
3.958	171.736
3.988	167.203
3.988	162.166
4.018	201.462
4.918	191.935
4.948	224.682
4.948	187.403
4.948	179.846
4.978	233.752
4.978	230.226
4.978	199.999
5.007	206.549
5.007	203.527
5.007	170.781
5.937	212.138
5.937	208.108
5.967	231.283
5.967	228.260
5.967	225.741
5.967	222.215
5.967	200.049
5.997	194.509
6.987	219.747
7.046	241.413
7.946	218.788
7.976	214.759
7.976	204.684
8.036	226.853
8.036	191.589
8.966	223.374
8.966	241.006
8.996	193.148
8.996	199.194
10.015	224.434
11.034	227.004
14.033	230.178];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d','cm'}; label.tL  = {'time since birth','disc width'}; 
temp.tL = C2K(27.4); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'PardKind2016';   

% length - weight
data.LWw = [ % disc width (cm), wet weight (g)
29.548	332.659
31.129	563.534
73.336	7350.315
100.234	6914.254
104.466	13994.204
119.242	18301.647
126.367	21440.031
130.850	21432.971
132.696	21430.064
135.334	21425.911
144.313	28892.076
148.530	27704.339
150.654	35575.014
151.967	32423.330
156.986	37139.840
161.997	37525.650
166.205	31219.812
169.914	40662.788
169.923	45780.890
172.032	45383.866
174.397	40655.728
179.158	48522.250
180.754	56393.755
183.349	32373.910
183.646	51664.787
183.951	74892.651
187.895	68587.228
188.138	56382.127
188.163	70555.307
189.734	64253.622
189.991	60709.909
190.251	58347.299
191.062	69763.347
193.700	70152.895
195.558	77236.578
196.594	66211.329
198.447	70539.110
198.717	73688.302
199.547	95734.233
199.771	73686.641
199.797	88253.522
200.052	83528.712
201.651	92581.314
202.144	73289.203
202.966	91004.440
204.291	94545.661
205.058	80764.925
205.064	83914.522
206.118	83519.160
206.400	93754.936
206.921	90604.509
207.161	76824.610
207.177	85879.699
207.181	88241.894
207.194	95722.190
207.204	101233.987
207.958	80366.656
209.039	94931.881
209.291	88238.571
210.086	90599.526
210.101	99260.919
211.128	83117.568
211.162	102408.855
211.395	85085.652
211.942	96108.415
212.228	109100.088
212.466	94139.086
212.473	98469.780
213.253	91775.639
213.770	86263.012
214.577	94923.160
214.853	102009.340
215.117	102008.924
215.616	86260.105
216.176	104369.463
216.418	92164.357
216.432	100432.049
216.687	95313.538
216.955	97675.323
217.238	108698.496
217.242	111060.697
217.497	105942.185
218.265	92948.852
218.551	105546.823
218.789	90979.522
219.088	110664.088
219.589	95702.671
220.129	103182.137
220.134	105938.032
220.916	100424.989
222.231	98454.414
222.249	109084.307
222.255	112233.903
224.339	97663.695
224.352	105143.991
225.150	109079.738
225.673	106716.713
226.461	104746.968
226.471	110258.765
226.476	113408.361
226.973	95691.043
227.245	100415.022
228.585	113011.338
228.819	95688.136
228.843	109467.625
229.367	107498.295
230.701	116551.313
231.479	109069.771
233.328	110641.662
233.610	120877.439
234.393	116151.798
235.688	103157.634
235.706	113000.125
236.248	121660.688
237.030	116147.645
237.538	105516.922
239.160	127955.313];
units.LWw  = {'cm','g'}; label.LWw  = {'disc width','wet weight'}; 
bibkey.LWw  = 'RambLamo2018';   

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RN63'; % Cat of Life
metaData.links.id_ITIS = '160998'; % ITIS
metaData.links.id_EoL = '46560990'; % Ency of Life
metaData.links.id_Wiki = 'Mobula_japanica'; % Wikipedia
metaData.links.id_ADW = 'Mobula_japanica'; % ADW
metaData.links.id_Taxo = '180181'; % Taxonomicon
metaData.links.id_WoRMS = '105858'; % WoRMS
metaData.links.id_fishbase = 'Mobula-japanica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mobula_japanica}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mobula-japanica}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PardKind2016'; type = 'article'; bib = [ ...  
'author = {Sebasti\''{a}n A. Pardo and Holly K. Kindsvater and Elizabeth Cuevas-Zimbr\''{o}n and Oscar Sosa-Nishizaki and Juan Carlos P\''{e}rez-Jim\''{e}nez and Nicholas K. Dulvy}, ' ...
'title = {Growth, productivity, and relative extinction risk of a data-sparse devil ray}, ' ...
'year = {2016}, ' ...
'volume = {6}, ' ...
'pages = {33745}, ' ...
'doi = {10.1038/srep33745}, ' ...
'journal = {Scientific Reports}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RambLamo2018'; type = 'article'; bib = [ ...  
'author = {Joshua M. Rambahiniarison and Mary Jane Lamoste and Christoph A. Rohner and Ryan Murray and Sally Snow and Jessica Labaja and Gonzalo Araujo and Alessandro Ponzo}, ' ...
'title = {Life History, Growth, and Reproductive Biology of Four {M}obulid Species in the {B}ohol {S}ea, {P}hilippines}, ' ...
'year = {2018}, ' ...
'volume = {5}, ' ...
'pages = {269}, ' ...
'doi = {10.3389/fmars.2018.00269}, ' ...
'journal = {Frontiers in Marine Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
