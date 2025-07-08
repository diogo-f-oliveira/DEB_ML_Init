function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_guttatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_guttatus'; 
metaData.species_en = 'Spotted rose snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 12]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AmezSoto2006';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'oldest catch, but max life span is probably much larger';
  
data.Lp  = 17.5; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HamaKuma1992';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 71; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.018 * TL^2.895, see F1';
data.Wwi = 5817; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.018 * TL^2.895, see F1';

data.Ri  = 2.17e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at TL = 48.5 cm';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.72); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'size is not specified, TL = 48.5 cm assumed as largest fish in AmezSoto2006';

% uni-variate data
% t-L data for females
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.527	14.235
2.020	17.170
2.465	18.784
2.957	19.371
3.497	21.279
4.005	22.159
4.499	31.258
5.023	32.432
5.499	31.551
5.992	33.459
6.485	36.981
6.993	38.742
7.501	39.036
7.977	40.503
9.963	48.281
10.995	48.428];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(28.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AmezSoto2006';
comment.tL_f = 'data for females';
% t-L data for males
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.017	6.164
1.526	9.979
2.035	15.556
2.480	17.023
2.957	19.078
3.497	21.132
4.005	24.067
4.991	29.350
5.468	31.698
5.976	35.807
6.437	38.449
7.041	38.742
7.486	41.677
7.978	41.677];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(28.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AmezSoto2006';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 2;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'weight-length relationship: W = 0.018 * TL^2.895';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 10 - 60 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7322W'; % Cat of Life
metaData.links.id_ITIS = '168874'; % ITIS
metaData.links.id_EoL = '46580774'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_guttatus'; % ADW
metaData.links.id_Taxo = '179225'; % Taxonomicon
metaData.links.id_WoRMS = '276539'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-guttatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus}}';
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
bibkey = 'AmezSoto2006'; type = 'Article'; bib = [ ... 
'author = {F. Amezcuaa and C. Soto-Avila and Y. Green-Ruiz}, ' ... 
'year = {2006}, ' ...
'title = {Age, growth, and mortality of the spotted rose snapper \emph{Lutjanus guttatus} from the southeastern {G}ulf of {C}alifornia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {77}, ' ...
'pages = {293-300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HamaKuma1992'; type = 'Article'; bib = [ ... 
'author = {S. Hamamoto and S. Kumagai and K. Nosaka and S. Manabe and A. Kasuga and Y. Iwatsuki}, ' ... 
'year = {1992}, ' ...
'title = {Reproductive Behavior, Eggs and Larvae of a {L}utjanid Fish, \emph{Lutjanus stellatus}, Observed in an Aquarium}, ' ...
'journal = {Japanese Journal of Ichthyology}, ' ...
'volume = {30}, ' ...
'pages = {219-228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lutjanus-guttatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
