function [data, auxData, metaData, txtData, weights] = mydata_Platyrhina_sinensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Platyrhinidae';
metaData.species    = 'Platyrhina_sinensis'; 
metaData.species_en = 'Fanray'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 25];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 25]; 

%% set data
% zero-variate data;
data.ab = 365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'YamaKume2009';    
  temp.ab = C2K(25.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'KumeFuru2008';   
  temp.am = C2K(25.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 21;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'KumeFuru2008';
data.Lp = 42.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'YamaKume2009'; 
data.Lpm = 39.3;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'YamaKume2009'; 
data.Li  = 68;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase'; 

data.Wwi  = 8.3e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'Neer2005'; 

data.Ri  = 6/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'YamaKume2009';   
  temp.Ri = C2K(25.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-12 pups per litter, 1 litter per yr';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.051	15.176
0.051	18.113
0.077	23.499
0.077	25.946
0.077	27.415
0.077	28.883
0.128	21.298
0.970	23.535
0.970	25.983
0.970	27.941
0.970	29.409
0.970	35.528
0.970	37.486
0.996	31.123
2.017	32.634
2.017	33.857
2.043	28.719
2.043	35.327
2.043	36.796
2.043	38.509
2.043	40.712
2.043	43.159
2.987	33.652
3.013	36.101
3.013	38.304
3.013	39.283
3.013	40.506
3.013	42.220
3.013	44.178
3.038	49.319
3.932	40.299
3.983	35.406
3.983	42.015
3.983	43.973
4.009	45.442
4.009	46.911
4.034	50.338
4.060	51.808
4.060	53.276
4.979	41.810
4.979	43.524
4.979	44.992
4.979	56.741
5.030	46.708
5.030	47.931
5.030	49.400
5.030	51.113
5.030	52.337
6.000	46.013
6.026	47.972
6.051	49.442
6.051	51.155
6.996	48.256
6.996	49.725
7.021	46.789
7.021	51.194
7.021	53.397
7.021	54.866
7.915	46.825
7.991	49.276
7.991	54.171
8.017	50.746
8.017	52.704
8.987	53.967
9.064	52.012
9.064	58.620
10.111	51.810
11.081	57.479
12.000	56.293];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(25.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'KumeFuru2008';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.006	16.573
0.006	18.304
0.033	20.037
0.039	36.857
0.059	22.264
0.060	23.995
0.060	25.974
0.061	27.211
0.061	28.448
0.981	29.970
0.981	30.959
0.982	33.185
0.983	35.412
0.984	38.627
1.006	28.487
1.056	25.273
1.056	27.252
1.952	33.473
1.975	24.322
1.979	35.453
1.979	37.184
1.980	38.668
1.980	40.152
2.006	41.885
2.032	42.875
2.924	38.212
2.975	36.483
2.976	39.946
2.978	45.140
2.979	46.872
3.002	41.926
3.003	43.163
3.005	48.604
3.972	40.729
3.973	42.461
3.997	38.999
3.999	44.193
4.000	46.172
4.993	41.019
4.994	43.245
4.995	44.976];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(25.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'KumeFuru2008';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JXW2'; % Cat of Life
metaData.links.id_ITIS = '564472'; % ITIS
metaData.links.id_EoL = '46560647'; % Ency of Life
metaData.links.id_Wiki = 'Platyrhina_sinensis'; % Wikipedia
metaData.links.id_ADW = 'Platyrhina_sinensis'; % ADW
metaData.links.id_Taxo = '184012'; % Taxonomicon
metaData.links.id_WoRMS = '282279'; % WoRMS
metaData.links.id_fishbase = 'Platyrhina-sinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platyrhina_sinensis}}';   
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
'howpublished = {\url{https://www.fishbase.se/summary/Platyrhina-sinensis}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KumeFuru2008'; type = 'article'; bib = [ ...  
'author = {Gen Kume and Keisuke Furumitsu and Atsuko Yamaguchi}, ' ...
'title = {Age, growth and age at sexual maturity of fan ray \emph{Platyrhina sinensis} ({B}atoidea: {P}latyrhinidae) in {A}riake {B}ay, {J}apan}, ' ...
'year = {2008}, ' ...
'journal = {Fisheries Science}, '...
'volume = {74}, ' ...
'pages = {736-742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YamaKume2009'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10228-008-0078-6}, ' ...
'author = {Atsuko Yamaguchi and Gen Kume}, ' ...
'title = {Reproductive biology of the fanray, \emph{Platyrhina sinensis} ({B}atoidea: {P}latyrhinidae) in {A}riake Bay, {J}apan}, ' ...
'year = {2009}, ' ...
'journal = {Ichthyol Res}, '...
'volume = {56}, ' ...
'pages = {133-139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
