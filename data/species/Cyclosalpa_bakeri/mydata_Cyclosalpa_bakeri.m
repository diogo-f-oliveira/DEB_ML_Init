function [data, auxData, metaData, txtData, weights] = mydata_Cyclosalpa_bakeri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Thaliacea'; 
metaData.order      = 'Salpida'; 
metaData.family     = 'Salpidae';
metaData.species    = 'Cyclosalpa_bakeri'; 
metaData.species_en = 'Salp';

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(11.5); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'WCb'; 'WCp'; 'WCi'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-V'; 'L-Wd'; 'L-WC'; 'L-JO'; 'L-F'; 'L-r'; 't-L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 05 31];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 05 31]; 

%% set data
% zero-variate data;
data.ax = 4;     units.ax = 'd';    label.ax = 'age at release';            bibkey.ax = 'MadiPurc1992';    
  temp.ax = C2K(11.5); units.temp.ax = 'K'; label.temp.ax = 'temperature';
data.tp = 8;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MadiPurc1992';
  temp.tp = C2K(11.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'from birth of oozoid to release of first chain of blastozooids';
data.am = 40; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(11.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.26;  units.Lb  = 'cm';  label.Lb  = 'body length at birth of oozooid';   bibkey.Lb  = 'MadiPurc1992';
  comment.Lb = 'from tL data';
data.Lx  = 1.7;  units.Lx  = 'cm';  label.Lx  = 'body length at release of oozooid';   bibkey.Lx  = 'MadiPurc1992';
  comment.Lx = 'embryos are released from aggregates when 15-20 mm long; whorls of aggregastes were relaseased from oozooid when 8-10 mm long';
data.Lp  = 5;  units.Lp  = 'cm';  label.Lp  = 'body length at puberty of oozooid';   bibkey.Lp  = 'MadiPurc1992';
data.Li  = 10;  units.Li  = 'cm';  label.Li  = 'ultimate oozoid length';   bibkey.Li  = 'MadiPurc1992';

data.WCx  = 5.8e-4;   units.WCx  = 'g';  label.WCx  = 'C weight at release of oozoid'; bibkey.WCx  = 'MadiPurc1992';
data.WCp  = 4.72e-3;   units.WCp  = 'g';  label.WCp  = 'C weight at puberty of oozoid'; bibkey.WCp  = 'MadiPurc1992';
data.WCi  = 15.83e-3;   units.WCi  = 'g';  label.WCi  = 'ultimate C weight of oozoid'; bibkey.WCi  = 'MadiPurc1992';
data.Wwi  = 44;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight of oozoid'; bibkey.Wwi  = 'MadiPurc1992';

data.Ri  = 5; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MadiPurc1992';   
temp.Ri = C2K(11.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-12 zooids per whorl, 1 whorl each 2 d';

% uni-variate data

% length - volume
data.LV = [ ... % oozoid length (cm), volume (ml)
1.2977	0.4274
1.7572	1.7546
1.9729	1.7842
1.9745	2.2606
1.9757	2.6996
2.1368	2.1264
2.2435	2.1237
2.3569	2.5330
2.4734	2.2037
2.4791	4.3944
2.4905	2.7916
2.6662	3.9743
2.9422	5.4352
2.9931	3.8852
3.0173	7.0191
3.0706	5.5373
3.1597	3.1853
3.1665	6.1064
3.3260	6.8648
3.5143	7.4178
3.7094	5.8464
3.7401	11.2060
3.9529	13.1025
3.9729	9.5555
4.2463	8.3091
4.4665	14.4151
4.9805	11.5714
5.0359	8.2728
5.4302	16.4663
5.4545	10.0557
6.8934	22.4377
7.5961	19.8840
8.0340	28.8814
8.1251	21.9068
9.4262	44.3886
9.5311	31.7350
9.5355	36.4326];
units.LV = {'cm', 'cm^3'}; label.LV = {'oozoid length', 'oozoid volume'};  
bibkey.LV = 'MadiPurc1992'; 

% length - dry weight
data.LWd = [ ... % oozoid length (cm), dry weight (mg)
0.7845	4.3265
0.7872	10.6543
0.8953	6.3920
0.9842	4.8090
0.9846	5.3824
1.0056	14.4155
1.1823	55.4417
1.1894	2.7220
1.1933	6.5170
1.4936	39.2594
2.0324	95.7832
2.2293	39.8893
2.2720	60.8261
2.3895	37.6244
2.4877	158.0478
2.5496	10.5718
2.6132	71.7177
2.6386	92.3826
2.9335	136.5957
2.9354	161.7420
2.9802	89.4830
3.0630	125.3620
3.1218	191.1612
3.4263	94.2655
3.4369	213.3300
3.5519	128.3605
3.8544	315.3429
3.9379	91.2583
4.4130	110.7609
4.6645	257.4084
4.8952	90.6530
4.9422	113.5310
4.9612	312.9180
5.4667	437.4526
5.5786	92.8708
6.0370	109.7045
6.6827	514.8231
7.1190	94.8141
7.8254	698.4225
8.5398	757.9755
9.0053	948.0025];
data.LWd(:,2) = data.LWd(:,2)/1e3; % convert mg to g
units.LWd = {'cm', 'g'}; label.LWd = {'body length', 'dry weight'};  
bibkey.LWd = 'MadiPurc1992'; 

% length - C weight
data.LWC = [ ... % oozoid length (cm), C weight (mg)
0.8187	0.5914
0.8382	0.1472
0.8472	0.4260
0.9570	0.4245
1.0235	0.1145
1.0250	0.2524
1.0438	0.3797
1.2540	0.5237
1.5444	0.3753
2.1351	0.9647
2.1368	1.4518
2.3484	0.7326
2.4737	0.6383
2.5215	1.5678
2.6313	0.9853
2.6347	1.9471
2.8224	1.2565
2.8522	3.2601
3.1155	6.2535
3.1917	2.2187
3.2467	1.8831
3.3929	2.4698
3.6728	4.0240
3.8639	1.8231
4.2238	5.2626
4.2273	8.1385
4.3641	1.6740
4.8508	3.2979
4.9838	5.3816
5.2483	4.0917
5.2578	10.6190
5.9224	2.3641
5.9355	7.6298
6.4166	6.1212
7.1334	13.0869
7.6925	2.8389
8.5656	14.1250
9.0207	11.0361
9.7598	13.6924];
data.LWC(:,2) = data.LWC(:,2)/1e3; % convert mg to g
units.LWC = {'cm', 'g'}; label.LWC = {'oozoid length', 'C weight'};  
bibkey.LWC = 'MadiPurc1992'; 

% length - respiration rate
data.LJO = [ ... % body length (cm), respiration (mumol/h)
2.0712	0.0644
2.8624	0.0465
3.7827	0.1511
4.1067	0.2741
4.2640	0.0984
4.6004	0.1831
4.6022	0.2999
4.7525	0.4852
4.8975	0.1809
5.2974	0.5111
5.3203	0.3082
5.7696	0.8490
5.8796	0.5665
5.8932	0.7972
5.9064	1.0011
6.0411	0.6681
6.5353	0.5129
6.9338	0.9666
7.2819	1.4877
7.3292	0.7904
7.5668	1.5465
7.6781	1.4893
7.7159	1.8007
8.8822	3.7159
9.1909	2.9994
9.8246	5.8013
9.8491	5.3100];
data.LJO(:,2) = 24 * data.LJO(:,2); % convert h to d
units.LJO = {'cm', 'mumol/d'}; label.LJO = {'oozoid length', 'respiration rate'};  
temp.LJO = C2K(11.5); units.temp.LJO = 'K'; label.temp.LJO = 'temperature';
bibkey.LJO = 'MadiPurc1992'; 

% length - growth rate
data.Lr = [ ... % oozoid length (cm), growth exponent g (1/h)  in d/dt L = L*g 
0.5414	0.0140
0.7820	0.0122
0.8301	0.0110
0.9865	0.0170
0.9865	0.0181
1.0947	0.0073
1.1188	0.0161
1.1669	0.0063
1.2150	0.0150
1.3113	0.0063
1.9008	0.0053
2.0331	0.0083
2.0331	0.0094
2.2376	0.0071
2.2857	0.0083
2.2857	0.0121
2.3098	0.0012
2.3218	0.0191
2.3459	0.0031
2.3940	0.0071
2.4902	0.0102
2.5023	0.0042
2.6707	0.0112
2.7068	0.0032
2.7068	0.0063
2.7910	0.0063
2.8030	0.0021
2.8511	0.0033
2.8632	0.0063
2.9835	0.0010
2.9955	0.0020
3.0075	0.0032
3.2722	0.0063
3.2842	0.0022
3.3925	0.0012
3.5248	0.0033
3.7053	0.0063
4.4992	0.0041
5.0165	0.0083
7.4346	0.0012
7.7353	0.0012];
data.Lr(:,2) = 24 * 3 * data.Lr(:,2); % 1/d, convert g to specific growth rate r in d/dt L = L*r/3
units.Lr = {'cm', '1/d'}; label.Lr = {'oozoid length', 'specific growth rate'};  
temp.Lr = C2K(11.5); units.temp.Lr = 'K'; label.temp.Lr = 'temperature';
bibkey.Lr = 'MadiPurc1992'; 

% time - length
data.tL = [ ... % time since birth (d), oozoid length (cm)
0.1174	0.2805
1.3039	0.3839
2.3711	0.5891
2.7860	0.6915
3.7945	0.7692
4.3867	1.0248
4.9803	1.0000
5.3352	1.2553
5.9279	1.4089
7.3513	1.5891
8.7148	1.8965
9.1878	2.2538
9.7800	2.5093
10.7875	2.7909
11.4994	2.8427
12.2097	3.2258
13.0993	3.3543
13.7512	3.5335
15.8836	4.3515
16.4173	4.4541
16.6009	3.3333
16.8295	5.0916
17.1326	3.8181
19.9236	3.4649
28.7473	7.3233
29.3993	7.4770
31.5342	7.8109
32.0101	7.5823];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'oozoid length'};  
temp.tL = C2K(11.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MadiPurc1992'; 

% length - filtering rate
data.LF = [ ... % body length (cm), filtering rate (l/h)
3.7157	0.1799
3.7316	0.4126
5.6929	1.1907
6.4076	2.8735
6.8589	1.6594
6.8605	2.2545
7.6756	2.3128
7.9991	1.4237
8.0025	2.7655
8.3324	6.0261
8.3693	8.8388
9.1503	10.7047
9.1597	6.8468
9.1601	7.2982];
data.LF(:,2) = data.LF(:,2)*24;
units.LF = {'cm', 'l/d'}; label.LF = {'oozoid length', 'filtering rate'};  
temp.LF = C2K(11.5); units.temp.LF = 'K'; label.temp.LF = 'temperature';
bibkey.LF = 'MadiPurc1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.LWd = 0 * weights.LWd;
weights.tp = 0 * weights.tp;
weights.WCx = 0 * weights.WCx;
weights.Lr = 3 * weights.Lr;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack data and txt_data for output
auxData.temp   = temp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Dry weights were ignored because of the large contribution of salt';     
D2 = 'Age at puberty and C weight at birth were also ignored because of consistency ';     
D3 = 'Specific filtering rate is very high because structural volume is very small';     
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3); 

%% Facts
F1 = 'Solitary generation salps would produce asexually about 170 aggregate generation offspring during their lifetime, and each aggregate blastozooid produces one solitary';
metaData.bibkey.F1 = 'MadiPurc1992';
F2 = 'Aggregates grow to reproductive sizes in 14 d';
metaData.bibkey.F2 = 'MadiPurc1992';
F3 = 'The aggregate generation is protogynous hermaphroditic; external fertilisation';
metaData.bibkey.F3 = 'MadiPurc1992';
F4 = 'From solitary to solitary generation takes 24 d';
metaData.bibkey.F4 = 'MadiPurc1992';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '32WXH'; % Cat of Life
metaData.links.id_ITIS = '159648'; % ITIS
metaData.links.id_EoL = '46585597'; % Ency of Life
metaData.links.id_Wiki = 'Cyclosalpa_bakeri'; % Wikipedia
metaData.links.id_ADW = 'Cyclosalpa_bakeri'; % ADW
metaData.links.id_Taxo = '341365'; % Taxonomicon
metaData.links.id_WoRMS = '266534'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclosalpa_bakeri}}'; 
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
bibkey = 'MadiPurc1992'; type = 'article'; bib = [ ...
'author = {Laurence P. Madin and Jennifer E. Purcell}, ' ...
'year = {1992}, ' ...
'title  = {Feeding, metabolism, and growth of \emph{Cyclosalpa bakeri} in the subarctic {P}acific}, ' ...
'journal = {Limnol. Oceanogr.}, ' ...
'volume = {37(6)}, '...
'pages = {1236-1251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
