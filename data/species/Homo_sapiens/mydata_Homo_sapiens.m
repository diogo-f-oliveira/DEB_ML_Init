function [data, auxData, metaData, txtData, weights] = mydata_Homo_sapiens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Hominidae';
metaData.species    = 'Homo_sapiens'; 
metaData.species_en = 'Human'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pXi'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2009 07 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Anne-Thea McGill'};    
metaData.date_mod_1     = [2015 04 20];              
metaData.email_mod_1    = {'at.mcgill@auckland.ac.nz'};            
metaData.address_mod_1  = {'University of Auckland,1142, New Zealand'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2021 12 31];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 15];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];


%% set data
% zero-variate data

data.tg = 305;   units.tg = 'd';    label.tg = 'gestation time';                 bibkey.tg = 'Wiki';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 665;     units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'guess';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4685;  units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5500;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';    bibkey.tpm = 'guess';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'based on tL data';
data.am = 85*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

  
data.Lb  = 60;     units.Lb  = 'cm';  label.Lb  = 'head-feet length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 160;    units.Lp  = 'cm';  label.Lp  = 'head-feet length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 165;    units.Li  = 'cm';  label.Li  = 'ultimate head-feet length';   bibkey.Li  = 'guess';

data.Wwb = 3313;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwx = 11750;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwp = 48e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';
data.Wwi = 68e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'guess';
data.Wwim = 80e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';         bibkey.Wwim = 'guess';

data.Ri  = 1/1000; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.pXi  = 4.2*2e6; units.pXi  = 'J/d'; label.pXi  = 'adult male maintenance intake'; bibkey.pXi  = 'guess';   
  temp.pXi = C2K(37); units.temp.pXi = 'K'; label.temp.pXi = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), head-feet length (m)
0.01822481473 0.5218074351; 
      0.4242089731 0.6488752111;
      1.034256445 0.7218652059;
      1.526001851 0.805800039;
      2.004516996 0.9003477247;
      2.674061662 0.9298597829;
      3.06765134 0.9757793423;
      3.425067522 1.027858381;
      4.0782108 1.055656853;
      4.557175021 1.100900084;
      5.065986075 1.113618996;
      5.666501453 1.151684027;
      5.988062236 1.174998556;
      6.401327343 1.223659203;
      6.965856341 1.24734019;
      7.280859687 1.269626893;
      7.484314876 1.282315561;
      7.97646258 1.32208182;
      8.593513446 1.347137578;
      9.062655545 1.389298305;
      9.660146369 1.39894447;
      10.05387638 1.429456387;
      11.53739462 1.492945909;
      12.12825004 1.510124048;
      12.73202698 1.550586148;
      13.12261394 1.565690098;
      13.55248314 1.593808848;
      14.1002833 1.651727413;
      14.49391663 1.692853484;
      15.12367384 1.764818254;
      15.63571527 1.783358157;
      16.31816899 1.837523743;
      16.63313803 1.863576759;
      17.21425553 1.868427809;
      17.50639985 1.877016553;
      17.71981126 1.878064868];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 100; % convert m to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head-feet length'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Came1984';
comment.tL = 'bad fit is probably due to changes in shape (relative leg-length)';  

% time-weight
data.tWw_f = [ ... time since birth (yr), weight (g)
1.138	4.460
1.744	5.432
2.405	6.479
2.929	7.689
3.673	8.983
4.556	10.441
5.522	12.071
6.432	13.885
7.646	16.220
8.722	18.948
9.798	21.456
10.819	24.678
11.868	28.384
12.806	32.310
13.910	37.549
14.820	43.640
15.703	50.983
16.917	57.730
17.635	62.394
18.380	67.434
19.374	72.500];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
data.tWw_f(:,2) = data.tWw_f(:,2) * 1000; % convert kg to g
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight', 'female'};  
temp.tWw_f    = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'fnwi';
comment.tWw_f = 'data for females';  
%
data.tWw_m = [ ... time since birth (yr), weight (g)
1.194	4.552
1.830	5.596
2.632	7.172
3.435	8.727
4.515	10.676
5.596	12.660
7.064	15.248
8.533	18.366
10.057	22.235
11.442	26.642
12.717	31.923
13.936	38.053
15.321	44.664
16.596	52.422
17.510	59.650
18.702	66.486
19.644	72.590
20.781	79.255];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % convert yr to d
data.tWw_m(:,2) = data.tWw_m(:,2) * 1000; % convert kg to g
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'weight', 'male'};  
temp.tWw_m    = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'fnwi';
comment.tL = 'data for males';  
   
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
weights.tWw_f =  5 * weights.tWw_f;
weights.tWw_m =  5 * weights.tWw_m;
weights.Wwx =  0 * weights.Wwx;
weights.Wwp =  0 * weights.Wwp;
weights.Wwi =  5 * weights.Wwi;
weights.tp =  3 * weights.tp;
weights.tg =  3 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.2;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = '{p_Am} makes a jump up at puberty in males';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D4 = 'mod_3: tWw data added';
D5 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Links
metaData.links.id_CoL = '6MB3T'; % Cat of Life
metaData.links.id_ITIS = '180092'; % ITIS
metaData.links.id_EoL = '327955'; % Ency of Life
metaData.links.id_Wiki = 'Homo_sapiens'; % Wikipedia
metaData.links.id_ADW = 'Homo_sapiens'; % ADW
metaData.links.id_Taxo = '66295'; % Taxonomicon
metaData.links.id_WoRMS = '1455977'; % WoRMS
metaData.links.id_MSW3 = '12100795'; % MSW3
metaData.links.id_AnAge = 'Homo_sapiens'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Homo_sapiens}}';
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
bibkey = 'Came1984'; type = 'Book'; bib = [ ... 
'author = {Cameron, N.}, ' ... 
'year = {1984}, ' ...
'title = {The measurement of human growth}, ' ...
'publisher = {Croom Helm}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Homo_sapiens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fnwi'; type = 'Misc'; bib = ...
'howpublished = {\url{https://staff.fnwi.uva.nl/a.j.p.heck/Research/groei/opdrachtA.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

