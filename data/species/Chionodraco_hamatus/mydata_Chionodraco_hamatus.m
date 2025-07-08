  function [data, auxData, metaData, txtData, weights] = mydata_Chionodraco_hamatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Chionodraco_hamatus'; 
metaData.species_en = 'Icefish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 15];

%% set data
% zero-variate data
data.ab = 90;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(-1.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 13*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(-1.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Chionodraco_rastrospinosus';
  
data.Lp = 35;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 49.8; units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0561;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 4.4-4.9 mm: pi/6*0.475^3';
data.Wwp = 286;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00105*Lp^3.52, see F1';
data.Wwi = 989.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00105*Li^3.52, see F1';

data.Ri = 4571/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-1.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_fm = [ ... % time(yr), total length (cm)
    5 34.07 32.50
    6 35.37 33.65
    7 38.66 35.19
    8 39.98 36.96
    9 41.17 36.96
   10 40.95 38.08];
data.tL_fm(:,1) = 365 * (0.9+data.tL_fm(:,1));  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time', 'total length'};  
temp.tL_fm = C2K(-1.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'VaccRoma2008'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % ln total length (mm), ln weight (g)
5.792	5.209
5.807	5.670
5.834	5.232
5.849	5.368
5.902	5.406
5.908	5.413
5.915	5.406
5.917	5.647
5.927	5.821
5.932	5.647
5.936	5.609
5.940	5.617
5.944	5.791
5.952	5.745
5.956	5.708
5.961	5.775
5.961	5.443
5.966	5.828
5.969	5.775
5.970	5.904
5.974	5.730
5.978	5.821
5.980	5.851
5.986	5.723
5.986	5.972
5.990	5.745
5.990	5.821
5.997	5.911
6.003	5.843
6.005	5.708
6.008	5.987
6.009	5.926
6.013	6.070
6.020	5.874
6.026	6.002
6.028	5.738
6.028	5.723
6.029	6.025
6.033	5.987
6.036	6.160
6.037	6.108
6.043	5.994
6.043	5.942
6.045	5.987
6.046	6.168
6.082	5.942];
data.LW_f = exp(data.LW_f); data.LW_f(:,1) =  data.LW_f(:,1)/ 10;
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'VaccRoma2008'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
5.704	4.726
5.709	5.337
5.723	5.268
5.778	5.249
5.785	5.361
5.786	5.022
5.786	5.414
5.793	5.240
5.799	5.270
5.799	5.323
5.807	5.382
5.807	5.194
5.809	5.262
5.809	5.428
5.815	5.336
5.824	5.366
5.828	4.717
5.829	5.381
5.831	5.524
5.839	5.350
5.844	5.478
5.846	5.545
5.849	5.447
5.850	5.485
5.852	5.349
5.855	5.409
5.858	5.514
5.858	5.379
5.859	5.552
5.859	5.348
5.861	5.597
5.864	5.408
5.867	5.604
5.868	5.566
5.869	5.363
5.872	5.340
5.872	5.581
5.872	5.445
5.874	5.566
5.875	5.611
5.880	5.724
5.880	5.603
5.884	5.535
5.884	5.467
5.886	5.656
5.886	5.565
5.887	5.459
5.888	5.512
5.888	5.754
5.891	5.693
5.891	5.550
5.891	5.421
5.892	5.625
5.898	5.828
5.898	5.647
5.899	5.775
5.901	5.609
5.902	5.587
5.903	5.768
5.903	5.677
5.904	5.556
5.906	5.699
5.908	5.526
5.908	5.639
5.911	5.775
5.914	5.850
5.915	5.797
5.915	5.752
5.917	5.548
5.918	5.736
5.919	5.646
5.923	5.781
5.924	5.630
5.926	5.743
5.926	5.622
5.927	5.834
5.931	5.758
5.935	5.961
5.937	5.750
5.938	5.908
5.941	5.923
5.945	5.878
5.946	5.802
5.956	5.696
5.962	5.914
5.980	5.822
5.992	6.048];
data.LW_m = exp(data.LW_m); data.LW_m(:,1) =  data.LW_m(:,1)/ 10;
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'VaccRoma2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm =  10 * weights.tL_fm;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00105*(TL in cm)^3.52';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XTG8'; % Cat of Life
metaData.links.id_ITIS = '642771'; % ITIS
metaData.links.id_EoL = '46573090'; % Ency of Life
metaData.links.id_Wiki = 'Chionodraco_hamatus'; % Wikipedia
metaData.links.id_ADW = 'Chionodraco_hamatus'; % ADW
metaData.links.id_Taxo = '170837'; % Taxonomicon
metaData.links.id_WoRMS = '234795'; % WoRMS
metaData.links.id_fishbase = 'Chionodraco-hamatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chionodraco_hamatus}}';  
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
bibkey = 'VaccRoma2008'; type = 'Article'; bib = [ ... 
'author = {M. Vacchi and M. Romanelli and M. La Mesa}, ' ...
'year = {2008}, ' ...
'title = {Age structure of \emph{Chionodraco_hamatus} (Teleostei, Chanuichthyidae) samples caught in {T}erra {N}ova {B}ay, {E}ast {A}ntarctica}, ' ... 
'journal = {Polar Biology}, ' ...
'volume = {12}, ' ...
'pages = {735-738}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chionodraco-hamatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
