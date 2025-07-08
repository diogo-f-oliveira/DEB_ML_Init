function [data, auxData, metaData, txtData, weights] = mydata_Pseudocheirus_peregrinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Pseudocheiridae';
metaData.species    = 'Pseudocheirus_peregrinus'; 
metaData.species_en = 'Common ringtail possum'; 

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 08]; 

%% set data
% zero-variate data

data.tg = 65;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'guess';   
  temp.tg = C2K(34.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '65-100 d';
data.tx = 180;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.1*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(34.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 400; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 850; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 1.5*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 litters per yr; 2 pups per litter';

% univariate data

% time-weight
data.tWw = [ ... % time since eye opening (d), weight (g)
23.421	2.020
42.484	16.162
51.287	14.141
55.201	10.101
58.623	12.121
63.023	14.141
72.314	14.141
78.179	20.202
87.954	30.303
91.861	40.404
96.264	36.364
99.191	50.505
101.146	52.525
104.566	58.586
105.060	48.485
108.478	58.586
111.886	90.909
113.341	115.152
115.796	94.950
116.765	113.131
118.240	96.970
119.196	141.414
121.665	92.929
122.143	115.152
124.560	171.717
124.597	96.970
125.550	147.475
125.558	131.313
126.054	117.172
133.375	145.455
133.386	123.232
134.349	153.535
137.278	163.636
139.233	165.657
140.693	179.798
141.687	147.475
142.150	200.000
144.591	208.081
145.562	222.222
146.071	181.818
148.026	183.838
148.994	204.040
150.454	218.182
152.392	254.545
152.899	218.182
153.847	280.808
154.360	230.303
155.326	254.545
155.805	274.747
156.279	307.071
158.239	298.990
158.258	258.586
158.739	274.747
161.664	294.949
163.609	317.172
165.068	333.333
166.553	296.970
168.499	317.172
169.975	298.990
172.371	397.980
172.400	339.394
173.361	373.737
175.301	406.061
175.802	381.818
177.289	341.414
180.194	400.000
180.669	428.283
180.699	367.677
180.711	343.434
182.614	450.505
185.087	393.939
185.562	422.222
186.524	454.546
188.009	418.182
188.485	444.444
189.941	466.667
189.971	406.061
190.415	498.990
192.409	420.202
192.870	478.788
193.364	466.667
193.837	501.010
195.790	507.071
196.292	480.808
197.302	414.141
198.263	448.485
200.167	555.556
201.162	521.212
201.640	543.434
202.146	509.091
202.651	474.748
203.583	569.697
203.607	521.212
205.101	464.646
208.460	595.960
208.471	573.737
209.495	478.788
209.955	539.394
212.381	577.778
213.370	555.556
213.377	541.414
213.423	446.465
214.334	583.838
214.334	583.838
214.362	527.273
214.805	620.202
219.212	608.081
219.215	602.020
219.248	535.354
222.127	646.465
222.150	600.000
223.177	501.010
225.119	529.293
225.563	620.202
226.065	593.939
226.565	571.717
228.555	501.010
230.428	672.727
230.440	646.465
230.946	612.121
236.311	640.404
236.319	624.242
236.326	610.101
236.836	567.677
238.299	575.758
239.269	591.919
240.190	709.091
242.668	640.404
248.481	753.535
248.520	672.727
252.914	688.889
254.365	721.212
254.375	701.010
256.827	684.848
256.860	618.182
262.662	753.535
262.696	682.828
270.045	654.545
270.058	628.283
273.947	674.747
274.390	769.697
279.789	729.293
281.751	717.172
290.533	757.576
292.453	830.303
297.372	771.717
300.309	765.657
300.315	753.535
303.272	705.051
305.185	793.939
310.083	777.778
310.095	753.535
311.030	840.404
328.617	874.747
344.763	856.566
357.490	830.303
384.371	858.586];
units.tWw  = {'d', 'g'};  label.tWw = {'time since eye opening', 'weight'};  
temp.tWw  = C2K(34.7);  units.temp.tWw = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw = 'Munk1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 50 * weights.tWw;
weights.Wwx = 0 * weights.Wwx;
weights.Wwi = 3 * weights.Wwi;


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6WDJX'; % Cat of Life
metaData.links.id_ITIS = '609828'; % ITIS
metaData.links.id_EoL = '323831'; % Ency of Life
metaData.links.id_Wiki = 'Pseudocheirus_peregrinus'; % Wikipedia
metaData.links.id_ADW = 'Pseudocheirus_peregrinus'; % ADW
metaData.links.id_Taxo = '169647'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000105'; % MSW3
metaData.links.id_AnAge = 'Pseudocheirus_peregrinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudocheirus_peregrinus}}';
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
bibkey = 'Munk1990'; type = 'phdthesis'; bib = [ ... 
'author = {Sarah Ann Munks}, ' ... 
'year = {1990}, ' ...
'title = {Ecological energetics and reproduction in the common ringtail possum, \emph{Pseudocheirus peregrinus} ({M}arsupialia: {P}halangeroidea)}, ' ...
'school = {University of Tasmania}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pseudocheirus_peregrinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

