function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_brevipinna
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_brevipinna'; 
metaData.species_en = 'Spinner shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MA','MAn','MI','MPW'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab = 12*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess';   
  temp.ab = C2K(27.4); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 21*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'JounLiao2005';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 70;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
data.Lp  = 180;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Bran1987'; 
data.Lpm = 170;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Bran1987'; 
data.Li  = 300;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 153e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00380*Li^3.07, see F1; fishbase gives 89.7 kg';

data.Ri  = 9/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-15 pups per litter, 1 litter each yr';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	66.838
1.068	112.239
2.070	120.991
2.357	130.291
3.045	143.145
7.139	185.538
7.252	180.342
7.397	190.188
9.255	196.205
11.685	207.692];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Bran1987';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.899	121.538
2.241	121.812
5.305	159.009
7.195	179.795
7.480	176.513
8.283	192.103];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','male'};  
temp.tL_m    = C2K(27.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Bran1987';
comment.tL_m = 'Data for males';

data.tL_f1 = [ ... % time since birth (yr), total length (cm)
1.623	130.798
2.625	150.434
3.627	146.904
4.663	167.696
5.664	180.383
6.701	180.325
7.530	215.029
8.704	224.230
9.637	223.021
10.638	242.656
11.605	258.819
12.572	257.608
13.609	247.126
14.645	262.127
15.612	255.123
16.613	289.817
17.581	282.814
18.617	276.965
19.549	268.806
20.586	278.015];
data.tL_f1(:,1) = data.tL_f1(:,1) * 365; % convert yr to d
units.tL_f1   = {'d', 'cm'};  label.tL_f1 = {'time since birth', 'total length','female'};  
temp.tL_f1    = C2K(27.4);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1  = 'JounLiao2005';
comment.tL_f1 = 'Data for females';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
130.414	11130.137
131.456	15410.959
132.497	18835.616
133.555	34246.575
147.354	21404.110
149.765	16267.123
150.803	17979.452
152.539	23972.603
153.573	22260.274
157.373	23116.438
161.518	23116.438
161.524	27397.260
164.294	31678.082
165.329	30821.918
166.705	26541.096
167.411	37671.233
168.778	27397.260
169.126	29109.589
170.208	62500.000
171.549	32534.247
172.238	31678.082
172.248	38527.397
173.265	24828.767
174.992	24828.767
175.007	35102.740
178.082	11130.137
178.451	28253.425
180.183	31678.082
180.847	11986.301
182.308	69349.315
182.583	18835.616
182.620	45376.712
192.289	43664.384
194.019	45376.712
195.059	47945.205
196.102	53082.192
196.432	41952.055
197.832	54794.521
200.581	44520.548
201.981	58219.178
203.348	47089.041
205.420	47089.041
209.252	70205.479
211.324	70205.479
214.763	59075.342
214.773	65924.658
217.530	61643.836
220.997	71061.644
221.359	83047.945
225.848	81335.616
225.857	88184.932
228.249	69349.315
229.645	79623.288
230.770	143835.616
233.803	89041.096
234.850	96746.575
239.327	87328.767
239.337	94178.082
242.104	96746.575
243.480	92465.753
244.872	100171.233
246.239	89897.260
247.331	130136.986
249.713	103595.890
250.149	169520.548
250.416	113013.699
252.799	87328.767
253.185	116438.356
253.522	110445.205
254.204	104452.055
254.567	117294.521
255.243	106164.384
257.709	141267.123
258.779	165239.726
259.813	163527.397
260.766	103595.890
260.773	108732.877
262.535	133561.644
262.539	136986.301
263.216	126712.329
265.266	110445.205
265.635	127568.493
266.331	130993.151
268.381	114726.027
270.184	169520.548
273.614	152397.260
273.651	178938.356
273.935	134417.808
275.669	139554.795
276.316	107876.712
276.690	128424.658
278.133	172945.205
278.170	199486.301
286.447	190068.493
289.163	155821.918
289.868	166095.890
290.243	187500.000
290.592	190068.493
292.977	166095.890
293.367	198630.137
295.358	139554.795
299.597	207191.781
300.177	127568.493];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f  = 'JounLiao2005';
comment.LWw_f = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_f = 3 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00380 * (TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: Fl  = 0.805 * TL';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'viviparous';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'R3N2'; % Cat of Life
metaData.links.id_ITIS = '160401'; % ITIS
metaData.links.id_EoL = '46559779'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_brevipinna'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_brevipinna'; % ADW
metaData.links.id_Taxo = '41975'; % Taxonomicon
metaData.links.id_WoRMS = '105788'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-brevipinna'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_brevipinna}}';
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
bibkey = 'Bran1987'; type = 'Article'; bib = [ ... 
'author = {Steven Branstetter}, ' ... 
'year = {1987}, ' ...
'title = {Age and Growth Estimates for Blacktip, \emph{Carcharhinus limbatus}, and Spinner, \emph{C. brevipinna}, Sharks from the {N}orthwestern {G}ulf of {M}exico}, ' ...
'journal = {Copeia}, ' ...
'volume = {1987(4)}, ' ...
'pages = {964-974}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JounLiao2005'; type = 'Article'; bib = [ ... 
'author = {Shoou-Jeng Joung and Yih-Yia Liao and Kwang-Ming Liu and Che-Tsung Chen and Len-Chi Leu}, ' ... 
'year = {2005}, ' ...
'title = {Age, growth, and reproduction of the spinner shark, \emph{Carcharhinus brevipinna}, in the northeastern waters of {T}aiwan}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {44(1)}, ' ...
'pages = {102-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-brevipinna.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

