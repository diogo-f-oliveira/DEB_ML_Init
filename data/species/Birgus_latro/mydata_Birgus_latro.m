function [data, auxData, metaData, txtData, weights] = mydata_Birgus_latro
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Coenobitidae';
metaData.species    = 'Birgus_latro'; 
metaData.species_en = 'Coconut crab'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi', 'MPE'};
metaData.ecoCode.habitat = {'0bTf', 'bjMp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiHs'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab', 'aj', 'ap', 'am', 'L_t', 'Lp', 'Li', 'Wwb', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 30]; 

%% set data
% zero-variate data

data.ab = 28;  units.ab = 'd'; label.ab = 'age at birth';                       bibkey.ab = 'ADW';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'before birth, mother moves to shallow water, carrying eggs till hatch';
data.tj = 28+21;  units.tj = 'd'; label.tj = 'time since birth at metam';       bibkey.tj = 'Wiki';   
  temp.tj = C2K(23); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '28 d for plankton stages (5 zoea stages), 21 d for single amphibious glaucothoe stage';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Wiki';
  temp.tp = C2K(27); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 100*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'OkaMiya2015';   
  temp.am = C2K(27);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 2.45;  units.Lp  = 'cm';  label.Lp  = 'thoracic length at puberty';  bibkey.Lp  = 'SatoYose2008';
data.Li  = 5;  units.Li  = 'cm';  label.Li  = 'ultimate thoracic length for females';  bibkey.Li  = 'OkaMiya2015';
data.Lim  = 8;  units.Lim  = 'cm';  label.Lim  = 'ultimate thoracic length for males';   bibkey.Lim  = 'OkaMiya2015';
data.L2  = 0.75;  units.L2  = 'cm';  label.L2  = 'thoracic length at 2.5 yr'; bibkey.L2  = 'EoL';
  temp.L2 = C2K(27);  units.temp.L2 = 'K'; label.temp.L2 = 'temperature';

data.Wwb = 4.1e-4; units.Wwb = 'g';   label.Wwb = 'dry weight at birth';        bibkey.Wwb = 'HamaMats2016';
  comment.Wwb = 'Based on egg width of 0.79 mm and length of 0.99 mm: pi/6*0.079* 0.099^2';
data.Wwp = 118;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'SatoYose2008';
  comment.Wwp = 'computed as (Lp/Li)^3*Wwi';
data.Wwi = 1.0e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Comeputed as (Li/Lim)^3*Wwim';
data.Wwim = 4.1e3;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';   bibkey.Wwim = 'Wiki';

data.Ri  = 138e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

data.LdL_f = [ ... % thoracic length (cm), change in thoracic length (cm/yr)
2.100	0.168
2.389	0.220
2.456	0.031
2.533	0.247
2.595	0.320
2.619	0.082
2.655	0.309
2.657	0.140
2.797	0.231
2.811	0.080
2.878	0.110
2.924	0.261
3.017	0.165
3.032	0.040
3.099	0.066
3.202	0.113
3.230	0.038
3.278	0.028
3.422	0.061
3.465	0.087
3.488	0.043
3.494	0.058
3.500	0.065
3.520	0.144
3.542	0.072
3.661	0.010
3.745	0.001
3.779	0.191
3.823	0.038
3.826	0.140
3.841	0.020
3.908	0.054
3.948	0.001
3.956	0.054
3.961	0.041
4.011	0.109
4.038	0.001
4.042	0.151
4.129	0.050
4.160	0.087
4.356	0.001];
data.LdL_f(:,2) = data.LdL_f(:,2)/ 365;
units.LdL_f = {'cm', 'cm/d'}; label.LdL_f = {'thoracic length', 'change in thoracic length', 'female'};  
temp.LdL_f = C2K(28);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'OkaMiya2015';
comment.LdL_f = 'Data for females; temp guessed in Ocean Expo Park, Okinawa Island, Japan, with 2 mnth reprod season';
%
data.LdL_m = [ ... % thoracic length (cm), change in thoracic length (cm/yr)
3.059	0.173
3.134	0.029
3.190	0.125
3.226	0.145
3.341	0.167
3.417	0.069
3.468	0.221
3.492	0.235
3.521	0.190
3.523	0.261
3.614	0.320
3.639	0.350
3.835	0.000
3.836	0.046
3.855	0.371
3.951	0.371
3.995	0.202
4.026	0.471
4.252	0.147
4.339	0.274
4.355	0.211
4.379	0.188
4.402	0.169
4.434	0.268
4.540	0.170
4.717	0.279
4.784	0.331
4.857	0.155
4.863	0.379
5.129	0.459
5.277	0.138
5.469	0.172
5.486	0.123
5.605	0.089
5.622	0.034
5.974	0.212
6.450	0.073
6.628	0.002];
data.LdL_m(:,2) = data.LdL_m(:,2)/ 365;
units.LdL_m = {'cm', 'cm/d'}; label.LdL_m = {'thoracic length', 'change in thoracic length', 'male'};  
temp.LdL_m = C2K(28);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'OkaMiya2015';
comment.LdL_m = 'Data for males; temp guessed in Ocean Expo Park, Okinawa Island, Japan, with 2 mnth reprod season';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f', 'LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Largest terrestrial arthropod';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Very powerfull claw when big';
metaData.bibkey.F2 = 'OkaTomi2016'; 
F3 = 'Juveniles use shell for housing (till 2-3 yr, with thoracic length 0.5 till 1 cm), but adults don not and harden their abdominal terga by depositing chitin and chalk';
metaData.bibkey.F3 = {'Wiki', 'EoL'}; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46505170'; % Ency of Life
metaData.links.id_Wiki = 'Birgus_latro'; % Wikipedia
metaData.links.id_ADW = 'Birgus_latro'; % ADW
metaData.links.id_Taxo = '33958'; % Taxonomicon
metaData.links.id_WoRMS = '208668'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Birgus_latro}}';
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
bibkey = 'OkaMiya2015'; type = 'Article'; bib = [ ... 
'author = {S. Oka and K. Miyamoto and S. Matsuzaki and T. Sato}, ' ... 
'year = {2015}, ' ...
'title = {Growth of the Coconut Crab, \emph{Birgus latro}, at its Northernmost Range Estimated from Mark-Recapture Using Individual Identification Based on Carapace Grooving Patterns}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {32}, ' ...
'pages = {260-265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OkaTomi2016'; type = 'Article'; bib = [ ... 
'author = {S. Oka and T. Tomita and K. Miyamoto}, ' ... 
'year = {2016}, ' ...
'title = {A Mighty Claw: Pinching Force of the Coconut Crab, the Largest Terrestrial Crustacean}, ' ...
'journal = {PLoS One}, ' ...
'volume = {11}, ' ...
'pages = {e0166108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/2982586/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Birgus_latro/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HamaMats2016'; type = 'Article'; bib = [ ... 
'author = {K. Hamasaki and T. Matsuda and K. Takano M. Sugizaki and Y. Murakami and S. Dan and S. Kitada}, ' ... 
'year = {2016}, ' ...
'title = {Thermal adaptations of embryos of six terrestrial hermit crab species}, ' ...
'journal = {Aquatic Biology}, ' ...
'volume = {25}, ' ...
'pages = {83--96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SatoYose2008'; type = 'Article'; bib = [ ... 
'author = {Sato, T. and Yoseda, K.}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive season and female maturity size of coconut crab \emph{Birgus latro} on {H}atoma {I}sland, southern {J}apan}, ' ...
'journal = {Fesheries Science}, ' ...
'volume = {74}, ' ...
'pages = {1277--1282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

