function [data, auxData, metaData, txtData, weights] = mydata_Malaclemys_terrapin
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Malaclemys_terrapin'; 
metaData.species_en = 'Diamondback terrapin'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biMm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab_26 = 81;      units.ab_26 = 'd';    label.ab_26 = 'age at birth';         bibkey.ab_26 = 'RoosKell1996';   
  temp.ab_26 = C2K(26);  units.temp.ab_26 = 'K'; label.temp.ab_26 = 'temperature';
data.ab_32 = 47;      units.ab_32 = 'd';    label.ab_32 = 'age at birth';         bibkey.ab_32 = 'RoosKell1996';   
  temp.ab_32 = C2K(32);  units.temp.ab_32 = 'K'; label.temp.ab_32 = 'temperature';
data.ap = 7*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'ADW';
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value is unsure';

data.Wwb = 10.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'RoosKell1996';
  comment.Wwb = '7.8-11.9 g';
data.Wwi = 720; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'ADW';
data.Wwim = 650; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwi = 'based on the assumption that males are somewhat smaller than females';

data.Ri  = 6*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-8 eggs per clutch, typicall >1 clutches per yr, 2 assumed';
 
% uni-variate data

% time-weight
data.tWw_f = [ ... % time (d), wet weight (g)
81.614	6.941
109.625	5.499
130.064	11.109
142.774	8.277
170.756	4.019
193.743	9.626
214.139	11.010
229.426	10.992
257.422	8.143
277.790	6.710
293.134	12.326
305.844	9.494
316.035	9.482
338.936	6.639
364.399	5.200
382.261	7.996
400.067	5.158
428.106	6.534
445.984	10.738
466.380	12.123
484.214	12.102
517.363	14.880
535.255	20.493
550.599	26.108
563.237	16.234
598.949	20.418
619.374	24.619
632.184	31.646
655.071	27.394
688.478	55.524
714.013	61.128
724.290	69.566
734.352	56.879
767.602	69.516
798.232	75.114
803.442	86.375
826.300	79.306
854.397	86.315
872.418	104.604
890.338	113.034
905.539	104.565
944.487	176.350
960.505	248.162
978.569	270.676
993.554	241.081
1021.292	212.880
1045.054	294.542
1062.989	304.380
1077.874	264.926
1118.551	256.428
1130.206	400.076
1153.251	411.317
1168.020	360.595];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(32);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'RoosKell1996';
comment.tWw_f = 'Data for females at 32 C; age class converted to age';
%
data.tWw_m = [ ... % time (d), wet weight (g)
72.961	5.866
95.934	9.412
116.316	9.392
131.602	9.377
159.613	8.159
182.586	11.706
200.420	11.688
213.115	8.106
253.879	8.066
269.194	10.430
289.576	10.410
304.805	5.636
330.311	7.990
355.818	10.344
371.118	11.519
391.486	10.309
419.468	6.712
439.850	6.692
455.136	6.676
478.095	9.033
501.024	9.011
524.055	17.316
541.860	14.919
562.141	6.570
587.705	13.684
608.159	19.613
631.103	20.780
648.822	11.244
674.631	38.583
700.195	45.697
720.606	48.056
730.653	36.148
758.837	49.208
779.334	58.706
807.446	65.817
809.820	51.537
843.071	62.212
863.597	74.090
881.504	80.021
896.559	60.970
928.085	139.465
951.014	139.443
966.763	177.501
984.020	129.891
1017.588	166.742
1030.557	185.766
1056.439	219.055
1068.369	152.414
1102.082	201.162
1120.363	238.028
1141.164	272.512
1152.993	197.543];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(26);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'RoosKell1996';
comment.tWw_m = 'Data for males at 26 C; age class converted to age';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwi = 10 * weights.Wwi;
weights.Wwim = 10 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females at 32 C, males at 26 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'A delay in the onset of growth had to be incorporated to match the tWw data';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'If eggs develop below 26 C males hatch, above 32 C females';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Males are smaller than females and reach puberty earlier';
metaData.bibkey.F2 = 'RoosKell1996'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3XKD4'; % Cat of Life
metaData.links.id_ITIS = '173780'; % ITIS
metaData.links.id_EoL = '46559489'; % Ency of Life
metaData.links.id_Wiki = 'Malaclemys_terrapin'; % Wikipedia
metaData.links.id_ADW = 'Malaclemys_terrapin'; % ADW
metaData.links.id_Taxo = '48629'; % Taxonomicon
metaData.links.id_WoRMS = '422564'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Malaclemys&species=terrapin'; % ReptileDB
metaData.links.id_AnAge = 'Malaclemys_terrapin'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Malaclemys_terrapin}}';
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
bibkey = 'RoosKell1996'; type = 'Article'; bib = [ ... 
'author = {Willem M. Roosenburg and Katherine C. Kelley}, ' ... 
'year = {1996}, ' ...
'title = {The Effect of Egg Size and Incubation Temperature on Growth in the Turtle, \emph{Malaclemys terrapin}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {30(2)}, ' ...
'pages = {198-204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Malaclemys_terrapin/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Malaclemys_terrapin}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

