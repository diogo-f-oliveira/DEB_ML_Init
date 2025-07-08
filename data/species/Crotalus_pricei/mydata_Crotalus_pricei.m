function [data, auxData, metaData, txtData, weights] = mydata_Crotalus_pricei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Crotalus_pricei'; 
metaData.species_en = 'Twin-spotted rattlesnake'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 12];              
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

data.ab = 70;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'ADW';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '27 to 32 C; 5 to 16 weeks incubation';
data.tp = 3.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'PrivSchr2012';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'guess';
  temp.tpm = C2K(25); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'based on tp/tmp ratio as found in Crotalus oreganus';
data.am = 15.7*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 13.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';     bibkey.Lb  = 'PrivSchr2012';  
data.Lp  = 39;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';      bibkey.Lp  = 'PrivSchr2012';
  comment.Lp = 'based on tp = 3 to 4 yr, read from tL_f data';
data.Lpm  = 35;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';      bibkey.Lpm  = 'PrivSchr2012';  
  comment.Lpm = 'based on tp = 3 to 4 yr, read from tL_m data';
data.Li  = 48;    units.Li  = 'cm';  label.Li  = 'ultimate SVL of females';  bibkey.Li  = 'PrivSchr2012';
  comment.Li = 'Wiki: total length 66 cm';
data.Lim  = 50;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL of males';  bibkey.Lim  = 'PrivSchr2012';

data.Wwb = 2.6;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'PrivSchr2012';
data.Wwi = 115;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of females';  bibkey.Wwi = 'PrivSchr2012';
data.Wwim = 188.5;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'PrivSchr2012';
  
data.Ri  = 4.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'PrivSchr2012';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.3 per clutch, 1 clutch per yr assumed';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.021	19.091
0.021	18.347
0.021	15.868
0.021	13.512
0.042	15.992
0.970	21.322
0.970	27.893
0.991	23.802
0.991	24.793
0.991	25.785
0.991	26.281
0.991	27.025
0.991	27.521
0.991	29.008
1.012	30.248
1.940	35.455
1.982	33.595
1.982	25.165
2.004	36.818
2.004	36.074
2.004	32.727
2.004	32.231
2.004	30.496
2.004	28.760
2.931	36.942
2.974	31.612
3.016	41.529
3.016	38.182
3.923	41.405
3.944	42.273
4.977	41.157
5.040	39.793
5.989	41.405
6.960	47.603
6.960	41.281
7.993	43.388
8.984	48.223
8.984	46.612
9.975	47.479
11.009	46.612
12.000	46.983];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PrivSchr2012';
comment.tL_f = 'Data for females in the Chiricahua Mountains, Arizona, USA';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.063	15.372
0.063	16.116
0.970	26.777
0.970	25.413
0.970	24.793
0.991	24.050
0.991	23.306
0.991	22.810
0.991	21.818
1.012	25.289
1.033	25.289
1.982	37.438
1.982	33.843
2.004	35.702
2.004	30.868
2.004	29.876
2.004	29.256
2.004	28.760
2.004	25.785
2.974	35.702
2.974	34.959
2.974	34.339
2.974	33.843
2.974	32.851
2.995	37.066
2.995	36.322
3.016	40.661
3.016	39.421
3.037	38.554
4.007	45.124
4.049	40.537
4.998	45.744
5.040	41.653
5.062	44.256
6.011	45.496
6.981	48.719
7.993	52.066
11.958	50.083];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PrivSchr2012';
comment.tL_m = 'Data for males in the Chiricahua Mountains, Arizona, USA';

%% set weights for all real data
weights = setweights(data, []);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Sex is determined by incubation temperature; ovoviviparous';
metaData.bibkey.F1 = 'retileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZPCR'; % Cat of Life
metaData.links.id_ITIS = '174315'; % ITIS
metaData.links.id_EoL = '1056759'; % Ency of Life
metaData.links.id_Wiki = 'Crotalus_pricei'; % Wikipedia
metaData.links.id_ADW = 'Crotalus_pricei'; % ADW
metaData.links.id_Taxo = '50387'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crotalus&species=pricei'; % ReptileDB
metaData.links.id_AnAge = 'Crotalus_pricei'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crotalus_pricei}}';
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
bibkey = 'PrivSchr2012'; type = 'Article'; bib = [ ... 
'author = {David B. Prival and Michael J. Schroff}, ' ... 
'year = {2012}, ' ...
'title = {A 13-YEAR STUDY OF A NORTHERN POPULATION OF TWINSPOTTED RATTLESNAKES (\emph{Crotalus pricei}): {G}ROWTH,REPRODUCTION, SURVIVAL, AND CONSERVATION}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {26}, ' ...
'pages = {1-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crotalus_pricei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Crotalus_pricei/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Crotalus&species=pricei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

