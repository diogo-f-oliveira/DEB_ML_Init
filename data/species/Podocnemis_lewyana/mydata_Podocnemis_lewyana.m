function [data, auxData, metaData, txtData, weights] = mydata_Podocnemis_lewyana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Podocnemididae';
metaData.species    = 'Podocnemis_lewyana'; 
metaData.species_en = 'Magdalena River turtle'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFr', 'biFm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biHs'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL';'T-ab'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 13];

%% set data
% zero-variate data

data.tp = 5.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PaezBock2015';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25.3*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Podocnemis expansa';
  
data.Lb = 4.4; units.Lb = 'cm';  label.Lb = 'carapace length at birth';     bibkey.Lb = 'PaezCorr2009';
data.Lp = 30; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for females';  bibkey.Lp = 'PaezBock2015';
data.Lpm = 20; units.Lpm = 'cm'; label.Lpm = 'carapace length at puberty for males';  bibkey.Lpm = 'PaezBock2015';
data.Li = 45.4; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';  bibkey.Li = 'PaezBock2015';
data.Lim = 34.8; units.Lim = 'cm'; label.Lim = 'ultimate carapace length for males';  bibkey.Lim = 'PaezBock2015';

data.Wwb = 30; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PaezCorr2009';
data.Wwi = 10.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
   comment.Wwi = 'based on (Li/Lim)^3*Wwim';
data.Wwim = 4.6e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'edgeofexistence';

data.Ri = 2*22/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'PaezBock2015';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '22 eggs per clutch, 1 to 4 clutches per yr';
  
% uni-variate data
% length- change in length
data.LdL_f = [ ... % straight carapace length (cm), change in length (cm/yr)
7.291	7.498
7.487	2.188
7.566	8.287
7.695	7.193
7.698	7.587
7.791	8.161
7.912	5.561
7.959	6.027
8.336	8.879
8.474	9.274
8.638	6.404
8.690	7.498
8.953	6.152
9.225	6.493
9.323	7.785
9.367	7.641
9.948	6.709
10.149	2.386
10.890	5.722
10.908	8.879
10.977	5.184
11.351	7.444
11.621	7.390
12.419	4.843
12.565	6.816
12.783	5.453
12.969	6.404
15.269	6.314
17.615	6.224
17.890	7.139
17.928	5.865
18.987	1.578
38.650	0.574];
units.LdL_f   = {'cm', 'cm/yr'};  label.LdL_f = {'straight carapace length', 'change in SCL', 'female'};  
temp.LdL_f    = C2K(27);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'PaezBock2015';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % straight carapace length (cm), change in length (cm/yr)
8.808	4.466
8.865	6.691
10.027	4.682
10.432	4.466
12.557	5.309
13.504	5.309
14.360	5.112
18.042	1.973
22.774	1.220
23.942	0.251
23.943	0.448
25.255	1.112
25.522	0.430
27.914	0.574];
units.LdL_m   = {'cm', 'cm/yr'};  label.LdL_m = {'straight carapace length', 'change in SCL', 'male'};  
temp.LdL_m    = C2K(27);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'PaezBock2015';
comment.LdL_m = 'Data for males';

% temperature-incubation time
data.Tab = [ ... % stemperature (C), age at birth (d)
    28    85.5
    29.5  69.5
    32    56.1
    33    52.6
    33.4  52.1
    34.7  50.0];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'PaezCorr2009';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f =  3 * weights.LdL_f;
weights.LdL_m =  3 * weights.LdL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'If eggs are incubated below 33 C, males hatch, above 33.5 C females'; 
metaData.bibkey.F1 = 'PaezCorr2009';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KQGB'; % Cat of Life
metaData.links.id_ITIS = '551848'; % ITIS
metaData.links.id_EoL = '790995'; % Ency of Life
metaData.links.id_Wiki = 'Podocnemis_lewyana'; % Wikipedia
metaData.links.id_ADW = 'Podocnemis_lewyana'; % ADW
metaData.links.id_Taxo = '48184'; % Taxonomicon
metaData.links.id_WoRMS = '1461474'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Podocnemis&species=lewyana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Podocnemis_lewyana}}';
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
bibkey = 'PaezCorr2009'; type = 'Article'; bib = [ ... 
'author = {Vivian P. P\''{a}ez and Juana C. Correa and Amalia M. Cano and Brian C. Bock}, ' ... 
'year = {2009}, ' ...
'title = {A Comparison of Maternal and Temperature Effects on Sex, Size, and Growth of Hatchlings of the {M}agdalena River Turtle (\emph{Podocnemis lewyana}) Incubated under Field and Controlled Laboratory Conditions}, ' ...
'journal = {Copeia}, ' ...
'volume = {2009}, ' ...
'pages = {698-704}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaezBock2015'; type = 'Article'; bib = [ ... 
'author = {Vivian P. P\''{a}aez and Brian C. Bock and Paula A. Espinal-Garc\''{i} and Beatriz H. Rend\''{o}n-Valencia and Diego Alzate-Estrada and Viviana M. Cartagena-Ot\''{a}lvaro and Selina S. Heppel}, ' ... 
'year = {2015}, ' ...
'title = {Life History and Demographic Characteristics of the {M}agdalena River Turtle (\emph{Podocnemis lewyana}): {I}mplications for Management}, ' ...
'journal = {Copeia}, ' ...
'volume = {103}, ' ...
'pages = {1058-1074}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Podocnemis_expansa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'edgeofexistence'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.edgeofexistence.org/species/magdalena-river-turtle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


