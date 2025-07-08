  function [data, auxData, metaData, txtData, weights] = mydata_Tenualosa_toli
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Tenualosa_toli'; 
metaData.species_en = 'Toli shad'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMpe', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-N_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 02];

%% set data
% zero-variate data
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 8;     units.Lj = 'cm';   label.Lj = 'total length at metam';  bibkey.Lj = 'BlabMilt1996';
data.Lp = 22;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'BlabMilt1996';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Tenualosa ilisha: pi/6*0.07^3';
data.Wwp = 137.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.09, see F1';
data.Wwi = 3.05e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.09, see F1; max published weight 5 kg';
  
data.Ri = 1.2e6/365;units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'BlabMilt1996';   
  temp.Ri = C2K(28.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
16.417	0.777
38.690	1.555
45.708	1.460
57.420	1.656
72.712	3.304
73.819	1.950
93.819	4.179
96.151	3.986
97.267	2.825
106.648	3.214
109.061	4.762
266.388	15.434
277.297	23.464
283.099	22.401
291.083	17.954
310.857	15.347
317.943	16.703
347.496	22.995
350.772	17.967
368.386	19.228
373.375	25.805
376.146	34.994
390.682	20.490
400.343	26.875
407.705	34.130
414.288	24.750
425.720	18.950
429.974	34.812
440.439	33.363
444.487	19.824
458.004	33.560
459.115	32.303
460.430	35.399
467.971	21.474
475.351	29.115
481.587	37.337
488.111	26.700
495.437	33.182
499.924	29.024
511.822	33.185
512.789	28.833
515.501	36.764
529.332	32.222
530.715	36.768
532.947	34.447
534.930	26.807
546.003	38.318
557.439	32.615
558.926	39.385
570.544	37.550
571.624	35.616
583.201	32.910
628.018	40.270
638.466	38.435
705.127	37.385
715.836	41.159
737.892	37.296
760.360	42.233
807.224	43.307];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'BlabMilt1996';

% length-fecundity
data.LN_La = [ ... % std length (cm), fecundity (#)
26.474	162501.673
29.309	245428.570
30.675	357595.181
30.951	343049.161
31.217	451767.531
31.321	292234.205
31.327	223351.151
31.676	444442.877
31.678	422690.343
31.693	230542.982
32.046	400878.738
32.048	375500.753
32.051	335621.134
32.054	299366.882
32.703	205002.555
32.770	527650.356
32.779	404386.049
32.878	310110.243
33.046	505853.519
33.426	331774.173
33.506	487652.597
33.602	429631.044
33.613	280988.752
33.683	571007.751
33.684	556506.034
33.777	541989.631
34.144	534679.662
34.160	324405.216
34.323	585406.096
34.334	444014.621
34.607	476599.121
34.787	512823.755
34.803	298923.860
34.992	233636.721
35.329	617872.456
35.699	577933.684
36.084	327720.550
37.161	635704.191
38.079	617429.432
38.542	544847.091];
units.LN_La = {'cm', '#'};  label.LN_La = {'std length', 'fecundity', 'Batang Lassa'};  
temp.LN_La = C2K(28.6);  units.temp.LN_La = 'K'; label.temp.LN_La = 'temperature'; 
bibkey.LN_La = 'BlabMilt1996';
%
data.LN_Lu = [ ... % std length (cm), fecundity (#)
22.108	176204.827
22.848	125594.262
23.849	155090.081
27.232	163729.491
28.403	280566.247
28.415	207843.554
29.138	262681.277
29.141	240864.436
29.313	313661.032
29.861	317518.998
30.222	350392.071
30.482	445042.462
31.318	358107.669
31.394	459956.657
31.737	612822.188
31.929	551081.987
31.943	463814.623
32.077	180232.640
32.226	402110.875
32.399	467635.302
32.846	540543.090
32.870	380552.700
32.951	449676.427
33.236	380700.509
33.412	424408.097
33.481	573526.852
33.971	355543.370
34.228	468374.351
34.575	595787.122
34.597	450341.570
34.602	417616.308
34.782	435870.804
34.855	555900.382
34.958	479578.391
35.208	639679.472
35.322	497907.123
35.334	417911.928
35.856	592668.205
36.775	560312.467
36.838	749428.822
36.905	909455.831
36.972	473119.175
37.090	298621.398
37.418	542390.712
37.422	516937.620
37.871	575300.568
38.158	491780.146
38.600	593776.778
39.144	619451.585
39.603	612364.012
40.613	1187317.646
41.896	569654.139
42.939	930075.447
44.732	567163.579];
units.LN_Lu = {'cm', '#'};  label.LN_Lu = {'std length', 'fecundity', 'Batang Lupar, Lassa'};  
temp.LN_Lu = C2K(28.6);  units.temp.LN_Lu = 'K'; label.temp.LN_Lu = 'temperature'; 
bibkey.LN_Lu = 'BlabMilt1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
%weights.Wwb = 3 * weights.Wwb;
%weights.Wwi = 3 * weights.Wwi;
weights.Ri = 0 * weights.Ri;
weights.Lj = 0 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LN_Lu','LN_La'}; subtitle1 = {'Data for Batang Lupar, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '55B8D'; % Cat of Life
metaData.links.id_ITIS = '551301'; % ITIS
metaData.links.id_EoL = '46562484'; % Ency of Life
metaData.links.id_Wiki = 'Tenualosa_toli'; % Wikipedia
metaData.links.id_ADW = 'Tenualosa_toli'; % ADW
metaData.links.id_Taxo = '188878'; % Taxonomicon
metaData.links.id_WoRMS = '217454'; % WoRMS
metaData.links.id_fishbase = 'Tenualosa-tolii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Tenualosa_toli}}';  
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
bibkey = 'BlabMilt1996'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00004998}, ' ...
'author = {Stephen J. M. Blaber and David A. Milton and Josephine Pang and Philip Wong and Ong Boon-Teck and Lolin Nyigo and David Lubim}, ' ... 
'year = {1996}, ' ...
'title = {The life history of the tropical shad \emph{Tenualosa toli} from {S}arawak: first evidence of protandry in the {C}lupeiformes?}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {46(3)}, ' ...
'pages = {225–242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Tenualosa-toli.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
