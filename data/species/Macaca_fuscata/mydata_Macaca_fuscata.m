function [data, auxData, metaData, txtData, weights] = mydata_Macaca_fuscata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Macaca_fuscata'; 
metaData.species_en = 'Japanese macaque'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika'};    
metaData.date_subm = [2018 08 18];              
metaData.email    = {'lika@uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 174;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 366;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1483;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1369;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 38.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 496;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1767;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 8883;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.5/2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   comment.Ri =' Litter size: 1.5, Litters per year: 0.5; inter-litter interval: 514 d';

% univariate data
% time-weight
tW_f_1 = [ ... % time since birth (yr), weight (kg), spring measurements
1.00, 2.34
2.03, 3.43
2.99, 4.51
3.97, 5.37
4.99, 6.68
5.97, 8.13
6.93, 8.36
7.98, 8.42
8.96, 8.83
9.90, 8.88
10.99, 8.75
11.93, 8.71
12.96, 9.49
13.90, 9.18
14.92, 8.38];
tW_f_2 = [ ... % time since birth (yr), weight (kg), summer measurements
1.07, 2.66
2.02, 3.83
3.00, 5.25
3.97, 5.54
4.95, 7.07
5.93, 7.95
6.96, 8.24
7.99, 8.52
8.95, 8.87
10.01, 8.81
10.97, 8.50
11.93, 8.67
12.92, 9.20
13.88, 9.19
14.91, 8.71];
tW_f_3 =[ ... % time since birth (yr), weight (kg), fall measurements
0.98, 3.45
1.99, 4.66
2.99, 6.16
4.00, 6.21
4.96, 8.16
5.95, 8.42
6.93 8.88
7.94, 9.51
8.93, 10.18
9.94, 9.64
10.97, 9.98
11.96, 9.32
12.94, 10.65
13.90, 10.41
14.94, 10.21];
tW_f_4 =[ ... % time since birth (yr), weight (kg), winter measurements
1.11, 3.46
2.07, 4.54
3.03, 5.80
4.03, 6.34
4.96, 8.54
5.97, 8.10
6.99, 8.34
7.99, 9.22
8.95, 9.41
9.91, 9.32
10.93, 9.32
11.92, 9.51
12.88, 9.51
13.88, 9.76
14.82, 9.71];
data.tW_f =[ tW_f_1; tW_f_2; tW_f_3; tW_f_4];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(37.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'AikiMits2015';
comment.tW_f = 'weight data for females from all seasons';

% time-weight for male
tW_m_1 = [ ... % time since birth (yr), weight (kg), spring measurements
1.02, 2.34
2.00, 3.61
3.01, 5.23
4.01, 6.72
4.99, 8.39
5.95, 10.11
6.91, 10.20
7.96, 11.20
8.96, 11.70];
tW_m_2 = [ ... % time since birth (yr), weight (kg), summer measurements
0.99, 2.66
2.02, 4.31
3.00, 5.78
3.96, 7.37
4.99, 9.38
5.97, 11.14
6.93, 11.02
7.99, 11.96
8.99, 12.84];
tW_m_3 = [ ... % time since birth (yr), weight (kg), fall measurements
0.97, 3.49
2.01, 5.16
2.97, 6.66
4.00, 8.20
5.03, 9.78
5.95, 11.49
6.93, 12.28
7.96, 12.33
8.95, 12.92];
tW_m_4 = [ ... % time since birth (yr), weight (kg), winter measurements
1.09, 3.51
2.11, 5.27
3.02, 6.93
4.04, 8.15
4.98, 9.85
6.00, 11.07
6.94, 10.93
7.94, 11.46
8.94, 11.85];
data.tW_m =[ tW_m_1; tW_m_2; tW_m_3; tW_m_4];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(37.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'AikiMits2015';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f =2*weights.tW_f;
weights.tW_m =2*weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
data.psd.k = 0.3;  units.psd.k  = '-';  label.psd.k  = 'maintenance ratio'; 
weights.psd.t_0 = 0.1; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Maraques were fed 4-5 times a day, with large amounts of food in spring and fall and little in summer and winter. In the estimation procedure we assume constant food during the year. ';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3WWNF'; % Cat of Life
metaData.links.id_ITIS = '555659'; % ITIS
metaData.links.id_EoL = '1037940'; % Ency of Life
metaData.links.id_Wiki = 'Macaca_fuscata'; % Wikipedia
metaData.links.id_ADW = 'Macaca_fuscata'; % ADW
metaData.links.id_Taxo = '168593'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100545'; % MSW3
metaData.links.id_AnAge = 'Macaca_fuscata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Japanese_macaque}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macaca_fuscata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AikiMits2015'; type = 'Article'; bib = [ ... 
'author = {K. Aoki and S. Mitsutsuka and A. Yamazaki and K. Nagai and A. Tezuka},' ...
'year = {2015}, ' ...
'title = {Effects of Seasonal Changes in Dietary Energy on Body Weight of Captive {J}apanese Macaques(\emph{Macaca fuscata})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {34}, ' ...
'pages = {255--261}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

