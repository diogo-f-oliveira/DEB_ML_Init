function [data, auxData, metaData, txtData, weights] = mydata_Anolis_sagrei
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Dactyloidae';
metaData.species    = 'Anolis_sagrei';
metaData.species_en = 'Brown anole';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 06];

%% set data
% zero-variate data;
data.ab = 50;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.0;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'Base on typical Anolis species';
data.Lp  = 3.9;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on Anolis acutus';
data.Li  = 4.3;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'SchoScho1978';
data.Lim = 5.4;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'SchoScho1978';

data.Wwb = 0.26; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwim = 'based on Anolis acutus';
data.Wwi = 2.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on LW data for Anolis autus';
data.Wwim = 4.8; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwi = 'based on LW data for Anolis autus; EoL gives 11.16 g';

data.Ri  = 18/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';
temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Anolis_gundlachi';

% uni-variate data
% length-change in length
data.LdL_f = [... % SVL (cm), change in SVL (cm/d)
2.69223	0.00309
2.72817	0.00320
2.74399	0.00233
2.75492	0.00317
2.80400	0.00315
2.84667	0.00462
2.85413	0.00735
2.92870	0.00595
2.92938	0.00662
3.02855	0.00380
3.09754	0.00519
3.10611	0.00980
3.13701	0.00463
3.13901	0.00316
3.26623	0.00883
3.27191	0.00266
3.27842	0.00732
3.29760	0.00449
3.31232	0.00550
3.33360	0.00468
3.34810	0.00555
3.34879	0.00309
3.41006	0.00508
3.42819	0.00265
3.44007	0.00418
3.46030	0.00603
3.47753	0.00547
3.50896	0.00561
3.58405	0.00985
3.77707	0.00286
3.81554	0.00873
3.88170	0.00383
3.94439	0.00393
3.97098	0.00381
3.97608	0.00420
3.98764	0.00316
4.01454	0.00321
4.02075	0.00420
4.03861	0.00420
4.06095	0.00420
4.06857	0.00343
4.07377	0.00384
4.11376	0.00744
4.17283	0.00217
4.17577	0.00343
4.19758	0.00316
4.20078	0.00260
4.22758	0.00260
4.27236	0.00264];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(20);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'SchoScho1978'; 
%
data.LdL_m = [... % SVL (cm), change in SVL (cm/d)
2.76742	0.00458
2.99844	0.00354
3.15570	0.00425
3.27351	0.00592
3.29328	0.00354
3.30425	0.00532
3.37854	0.00382
3.40312	0.00600
3.43905	0.00623
3.45261	0.00642
3.50928	0.01187
3.54758	0.00810
3.57151	0.00455
3.57541	0.00407
3.64708	0.01034
3.65092	0.00912
3.65714	0.00529
3.66995	0.00470
3.69819	0.01535
3.86201	0.00467
3.87307	0.00715
4.02874	0.00623
4.04492	0.00444
4.05626	0.01761
4.11606	0.01015
4.17566	0.00563
4.29825	0.00836
4.35170	0.00810
4.40112	0.00350
4.44377	0.00570
4.47416	0.00479
4.50725	0.00688
4.54945	0.01028
4.56020	0.01478
4.60312	0.01041
4.64108	0.00663
4.65517	0.00761
4.69916	0.00663
4.77832	0.00516
4.82793	0.00567
4.83902	0.00356
4.88669	0.00650
4.90794	0.00522
4.97388	0.00422
4.99535	0.00354
5.04567	0.00449
5.05033	0.00467
5.05061	0.00494
5.07579	0.00356
5.07666	0.00425
5.10706	0.00356
5.12993	0.00397
5.15292	0.00452
5.15480	0.00269
5.20169	0.00420
5.22430	0.00444
5.28007	0.00279
5.29519	0.00394
5.37598	0.00425];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(20);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'SchoScho1978'; 

%% set weights for all real data
weights = setweights(data, []);
%weights.LdL_f = 3 * weights.LdL_f;
%weights.LdL_m = 3 * weights.LdL_m;
weights.Li = 10 * weights.Li;
weights.Lim = 10 * weights.Lim;
weights.Lb = 3 * weights.Lb;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1,'D2',D2);

%% Links
metaData.links.id_CoL = '5V5QJ'; % Cat of Life
metaData.links.id_ITIS = '173903'; % ITIS
metaData.links.id_EoL = '47044692'; % Ency of Life
metaData.links.id_Wiki = 'Anolis_sagrei'; % Wikipedia
metaData.links.id_ADW = 'Anolis_sagrei'; % ADW
metaData.links.id_Taxo = '49118'; % Taxonomicon
metaData.links.id_WoRMS = '1485225'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anolis&species=sagrei'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anolis_sagrei}}';   
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
bibkey = 'SchoScho1978'; type = 'Article'; bib = [ ...  
'author = {Thomas W. Schoener and Amy Schoener}, ' ...
'title = {Estimating and Interpreting Body-Size Growth in Some {A}nolis Lizards}, ' ...
'journal = {Copeia}, ' ...
'volume = {1978(3)}, ' ...
'pages = {390-405}, ' ...
'year = {1973}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/47044692}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

