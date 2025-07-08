function [data, auxData, metaData, txtData, weights] = mydata_Tautogolabrus_adspersus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Tautogolabrus_adspersus'; 
metaData.species_en = 'Cunner'; 

metaData.ecoCode.climate = {'MB', 'Dfb'};
metaData.ecoCode.ecozone = {'MANW','THn'};
metaData.ecoCode.habitat = {'0jMc', 'jiMr','0jFe'};
metaData.ecoCode.embryo  = {'Mp','Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2020 09 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 28]; 

%% set data
% zero-variate data

data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SercCole1974';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'NitsMath2001';
data.Li  = 38;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';

% univariate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm) 
    1  4.51
    2  7.72
    3 12.34
    4 15.32
    5 17.68
    6 20.41];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SercCole1974';

% length - weight
data.LWw = [ ...
    2.470   0.15
    3.405   0.43
    4.400   1.03
    5.461   2.07
    6.460   3.90
    7.592   6.78
    8.407   9.37
    9.490  14.39
   10.170  20.00
   11.500  26.88
   12.460  33.60
   13.530  43.58
   14.430  51.83
   15.520  61.91
   16.310  81.60
   17.460  92.97
   18.490 110.37
   19.520 132.48
   20.260 159.40];
units.LWw  = {'cm', 'g'};  label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'SercCole1974';

% length - fecundity
data.LN = [ ... % total length (log mm), fecundity (log #)
1.837	3.260
1.856	3.711
1.860	3.092
1.866	3.433
1.875	3.539
1.878	3.762
1.879	3.089
1.879	3.288
1.880	3.946
1.886	3.766
1.887	3.958
1.887	3.257
1.888	3.300
1.890	3.386
1.898	4.282
1.898	3.664
1.903	4.369
1.909	3.570
1.913	3.465
1.917	3.633
1.918	4.064
1.924	3.457
1.928	3.872
1.932	4.275
1.943	4.013
1.951	3.884
1.957	4.264
1.960	3.888
1.960	4.166
1.962	3.751
1.963	3.825
1.964	4.271
1.969	4.021
1.971	4.182
1.971	4.228
1.972	4.338
1.975	4.123
1.977	3.935
1.978	3.861
1.978	4.158
1.980	4.244
1.983	4.088
1.984	4.346
1.984	4.444
1.988	3.982
1.989	4.029
1.996	3.982
1.996	4.233
1.998	3.704
1.999	3.841
2.007	4.272
2.009	3.892
2.015	3.935
2.016	3.763
2.018	4.393
2.020	4.268
2.020	4.456
2.027	4.112
2.028	4.284
2.029	4.026
2.030	4.225
2.036	4.648
2.043	4.640
2.044	4.347
2.046	4.511
2.050	4.464
2.050	4.703
2.051	4.284
2.052	4.190
2.053	4.132
2.055	4.092
2.055	4.249
2.058	4.492
2.066	4.112
2.066	4.206
2.067	4.253
2.069	3.987
2.071	4.421
2.071	4.617
2.072	4.112
2.074	4.723
2.076	4.257
2.081	4.382
2.083	4.026
2.084	4.198
2.084	4.249
2.084	4.402
2.088	4.101
2.089	4.288
2.090	4.508
2.092	4.210
2.093	4.402
2.094	4.598
2.094	4.159
2.095	4.363
2.098	4.445
2.102	4.523
2.102	4.555
2.109	4.512
2.112	4.586
2.115	4.418
2.116	4.602
2.116	4.539
2.119	4.473
2.121	4.312
2.121	4.351
2.123	4.610
2.125	4.430
2.125	4.492
2.125	4.140
2.130	4.379
2.131	4.700
2.133	4.465
2.134	4.586
2.136	4.289
2.143	4.700
2.144	4.344
2.144	4.293
2.144	4.438
2.145	4.383
2.145	4.536
2.145	4.579
2.150	4.391
2.151	4.720
2.155	4.133
2.155	4.606
2.156	4.532
2.158	4.767
2.158	4.708
2.160	4.375
2.162	4.657
2.166	4.732
2.167	4.536
2.171	4.458
2.171	4.516
2.172	4.301
2.173	4.505
2.177	4.246
2.177	4.614
2.179	4.516
2.181	4.399
2.181	4.540
2.182	4.176
2.182	4.747
2.185	4.697
2.185	4.837
2.186	4.215
2.189	4.477
2.190	4.732
2.191	4.442
2.196	4.673
2.197	4.634
2.199	4.509
2.199	4.552
2.203	4.313
2.204	4.579
2.205	4.485
2.211	4.517
2.213	4.615
2.215	4.908
2.217	4.756
2.220	4.713
2.222	4.881
2.229	4.756
2.230	4.885
2.231	4.955
2.232	4.631
2.238	4.725
2.239	4.556
2.240	4.873
2.241	4.486
2.244	4.811
2.254	4.599
2.260	4.838
2.268	4.670];
data.LN = 10.^data.LN; % remove log transform
data.LN(:,1) = data.LN(:,1)/10; % convert mm to cm
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'NitsMath2001';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g: 0.00891 * (TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54ZGZ'; % Cat of Life
metaData.links.id_ITIS = '170481'; % ITIS
metaData.links.id_EoL = '46571824'; % Ency of Life
metaData.links.id_Wiki = 'Tautogolabrus_adspersus'; % Wikipedia
metaData.links.id_ADW = 'Tautogolabrus_adspersus'; % ADW
metaData.links.id_Taxo = '188843'; % Taxonomicon
metaData.links.id_WoRMS = '159785'; % WoRMS
metaData.links.id_fishbase = 'Tautogolabrus-adspersus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tautogolabrus_adspersus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Tautogolabrus-adspersus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SercCole1974'; type = 'article'; bib = [ ... 
'author = {Fredric M. Serchuk and Charles F. Cole}, ' ... 
'year = {1974}, ' ...
'title = {Age and Growth of the Cunner, \emph{Tautogolabrus adspersus} ({W}albaum) ({P}isces: {L}abridae)in the {W}eweantic {R}iver Estuary, {M}assachusetts}, ' ...
'journal = {Chesapeake Science}, ' ...
'volume = {15(4)}, ' ...
'howpublished = {205-213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NitsMath2001'; type = 'article'; bib = [ ... 
'author = {Paul Nitschke and Martha Mather}, ' ... 
'year = {2001}, ' ...
'title = {A Comparison of Length-, Weight-, and Age-Specific Fecundity Relationships for Cunner in {C}ape {C}od {B}ay}, ' ...
'journal = {North American Journal of Fisheries Management}, ' ...
'volume = {21}, ' ...
'howpublished = {86-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NitsBurn2001'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(2001)130<1150:AAGVFC>2.0.CO;2}, ' ...
'author = {Paul Nitschke and Jay Burnett and Brian C. Kelly}, ' ... 
'year = {2001}, ' ...
'title = {Age and Growth Verification for Cunner in {W}estern {C}ape {C}od {B}ay, {M}assachusetts, Using Tag-Recapture Data}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {130(6)}, ' ...
'howpublished = {1150-1163}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
