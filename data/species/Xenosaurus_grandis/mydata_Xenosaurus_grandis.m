function [data, auxData, metaData, txtData, weights] = mydata_Xenosaurus_grandis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Xenosauridae';
metaData.species    = 'Xenosaurus_grandis'; 
metaData.species_en = 'Knob-scaled lizard'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(22.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 17];

%% set data
% zero-variate data

data.ab = 9*30.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(22.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 32*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'ZuniRoja2005';   
  temp.tp = C2K(22.7); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 28*30.5;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ZuniRoja2005';   
  temp.tpm = C2K(22.7); units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(22.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 5.018;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'ZuniRoja2005';
data.Li  = 12.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'ZuniRoja2005';  

data.Wwi = 23.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Lacerta agilis: (12.5/10)^3*12';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(22.7);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 7 young per clutch, but possibly less than 1 clutch per yr';

% univariate data
% time -length data
data.tL = [ ... % time since birth (d), SVL  (cm)
1.235	5.172
34.253	4.987
45.737	5.256
74.057	5.307
74.353	5.777
96.752	5.407
96.815	5.508
102.599	5.710
114.020	5.878
147.777	5.576
193.081	5.643
198.992	6.046
210.445	6.265
215.712	5.644
238.828	6.416
250.228	6.551
261.122	5.879
284.090	6.417
295.575	6.685
306.679	6.350
323.779	6.551
323.884	6.719
324.011	6.921
346.378	6.501
352.416	7.106
380.768	7.207
426.178	7.442
426.273	7.593
431.666	7.173
465.877	7.593
466.120	7.980
471.471	7.493
493.954	7.258
585.017	8.115
653.089	8.401
675.604	8.216
675.667	8.317
692.862	8.670
715.503	8.687
738.272	8.905
755.403	9.157
760.903	8.906
760.966	9.006
806.228	9.007
817.680	9.225
880.021	9.394
896.836	9.142
896.952	9.327
908.384	9.511
936.694	9.545
948.220	9.881
970.967	10.066
981.977	9.579
993.577	10.033
1016.345	10.251
1033.065	9.848
1055.527	9.580
1072.627	9.781
1101.370	10.504
1101.444	10.621
1129.869	10.840
1140.921	10.420
1157.746	10.185
1163.552	10.420
1185.930	10.017
1214.799	10.941
1259.734	10.421
1260.177	11.126
1305.418	11.093
1328.175	11.295
1350.310	10.506
1350.880	11.412
1362.101	11.261
1401.641	11.161
1407.426	11.363
1407.468	11.430
1412.492	10.422
1418.699	11.295
1423.882	10.540
1435.472	10.977
1446.988	11.296
1458.198	11.128
1458.388	11.430
1486.866	11.733
1514.838	11.229
1543.117	11.213
1554.812	11.817
1571.553	11.448
1576.915	10.978
1577.411	11.767
1582.721	11.213
1605.331	11.179
1622.462	11.431
1622.779	11.935
1633.830	11.516
1633.873	11.583
1651.078	11.952
1667.439	10.979
1673.572	11.734
1690.672	11.936
1696.013	11.432
1701.512	11.180
1701.924	11.835
1707.244	11.298
1752.938	11.987
1803.373	11.215
1803.626	11.618
1809.421	11.836
1809.547	12.038
1814.889	11.534
1848.835	11.534
1866.325	12.357
1871.519	11.618
1883.098	12.038
1917.161	12.223
1951.107	12.223
1962.306	12.039
1979.005	11.602
1985.053	12.224
1985.138	12.358
2030.009	11.737
2046.866	11.553
2154.585	11.906
2166.164	12.326
2205.547	11.974
2205.652	12.142
2216.683	11.688
2222.868	12.528
2227.946	11.604
2250.967	12.226
2386.563	11.925
2392.316	12.076
2415.042	12.227
2437.778	12.395
2516.701	11.943
2811.569	13.003
2896.023	12.349
3026.151	12.350
3071.455	12.418
3376.952	12.387
3422.235	12.420];
units.tL  = {'d', 'g'};  label.tL = {'time since birth', 'wet weight'};  
temp.tL   = C2K(22.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZuniRoja2005';

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

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5CBJS'; % Cat of Life
metaData.links.id_ITIS = '586165'; % ITIS
metaData.links.id_EoL = '790698'; % Ency of Life
metaData.links.id_Wiki = 'Xenosaurus_grandis'; % Wikipedia
metaData.links.id_ADW = 'Xenosaurus_grandis'; % ADW
metaData.links.id_Taxo = '49712'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Xenosaurus&species=grandis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xenosaurus_grandis}}';
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
bibkey = 'ZuniRoja2005'; type = 'Article'; bib = [ ... 
'author = {J. Jaime Zuniga-Vega and R. Isaac Rojas-Gonz\''{a}lez and Julio A. Lemos-Espinal and M. Esther P\''{e}rez-Trejo}, ' ... 
'year = {2005}, ' ...
'title = {Growth Ecology of the Lizard \emp{Xenosaurus grandis} in {V}eracruz, {M}\''{e}xico}, ' ...
'pages = {433-443}, ' ...
'volume = {39(3)}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

