function [data, auxData, metaData, txtData, weights] = mydata_Ambystoma_maculatum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Ambystomatidae';
metaData.species    = 'Ambystoma_maculatum'; 
metaData.species_en = 'Spotted salamander'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCii','bpAa'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 21];

%% set data
% zero-variate data

data.ab = 38.5;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'amphibiaweb';
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4-7 wk';
data.tj = 150;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(10); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '2-4 mnth';
data.tp = 3*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 32*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';         bibkey.Lj  = 'guess'; 
data.Lp  = 6.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';         bibkey.Lp  = 'guess'; 
data.Li  = 13;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';            bibkey.Li  = 'amphibiaweb';
  comment.Li = 'amphibiaweb: TL 15-25 cm';
  
data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm for Ambystoma_mexicanum: pi/6*0.2^3';
data.Wwi = 12.84;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';

data.Ri = 100/365; units.Ri = '#/d';   label.Ri = 'reprod rate';         bibkey.Ri = 'AnAge';
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '100 eggs per clutch, 1 clutch per yr';

% univariate data
% length-length
data.LL_f = [ ... % initial SVL (cm), final SVL (cm), interval (yr)
 9.529  9.755 1
 9.700 10.434 1
10.003 10.134 1	
10.023 10.211 1
10.062 10.194 1
10.176 10.571 1
10.705 10.291 1
10.330 10.669 1
10.313 10.369 1
10.352 10.822 1
10.372 10.429 1
10.468 10.882 1
10.394 10.507 1
10.509 11.356 1
10.529 11.018 1
10.757 10.851 1
10.682 10.871 1
10.684 10.872 1
10.912 11.288 1
11.045 11.195 1
11.046 11.216 1
11.143 11.349 1
11.200 11.539 1
11.220 11.654 1
11.316 11.655 1
11.374 11.430 1	
11.902 12.091 1
10.024 10.664 2
10.138 10.533 2
10.215 10.817 2
10.273 11.007 2
10.463 10.821 2
10.502 10.784 2
10.503 10.918 2
10.505 11.145 2
10.638 11.015 2
10.715 11.261 2
10.943 11.093 2
10.831 10.982 2
11.002 11.397 2
10.947 11.041 2
10.986 11.081 2
10.988 11.101 2
11.065 11.517 2
11.330 12.553 2
11.557 11.614 2
11.540 11.765 2
11.541 12.520 2
11.580 11.769 2
11.563 11.714 2
12.016 12.242 2
 9.573 10.213 3
 9.556 10.139 3
10.047 10.668 3
10.067 10.895 3
10.145 10.521 3
10.484 12.404 3
10.599 11.427 3
10.770 11.522 3
10.978 12.070 3
11.168 11.356 3
11.264 12.110 3
11.359 12.282 3
11.831 12.076 3
 9.877 10.950 4
10.067 11.366 4
10.426 10.859 4
10.560 10.917 4
10.919 11.126 4
11.711 11.805 4];
time.LL_f = data.LL_f(:,3) * 365; units.time.LL_f  = 'd'; label.time.LL_f = 'time interval';
data.LL_f = data.LL_f(:,1:2); treat.LL_f = {0};
units.LL_f  = {'cm', 'cm'};  label.LL_f = {'initial SVL', 'final SVL', 'females'};  
temp.LL_f   = C2K(24);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'RussPowe1996';
%
data.LL_m = [ ...
 8.441  8.635 1
 8.455  9.074 1 
 8.455  8.946 1
 8.533  9.101 1
 8.728  9.115 1
 8.896  9.451 1
 8.897  9.516 1
 8.975  9.091 1
 9.053  9.440 1
 9.002  9.105 1
 9.183  9.622 1
 8.861  9.222 1
 9.249  9.546 1
 9.211  9.314 1
 9.353  9.728 1
 9.406 10.038 1
 9.419  9.574 1
 9.407  9.717 1
 9.446  9.536 1 
 9.459  9.524 1
 9.512  9.667 1
 9.319  9.525 1
 9.513  9.836 1
 9.513  9.953 1
 9.436  9.514 1
 9.502  9.734 1
 9.541  9.722 1
 9.567 10.148 1
 9.581  9.762 1
 9.594 10.408 1
 9.634  9.750 1
 9.595  9.983 1
 9.609  9.738 1
 9.622  9.894 1
 9.662  9.946 1
 9.636  9.998 1
 9.702  9.792 1
 9.676  9.960 1
 9.729  9.896 1
 9.600  9.755 1
 9.717  9.755 1
 9.808  9.911 1
 9.731  9.795 1
 9.796  9.835 1
 9.797  9.848 1
 9.836 10.055 1
 9.837  9.862 1
 9.927 10.186 1
10.109 10.134 1
10.109 10.161 1
10.187 10.291 1
10.175 10.214 1
 9.995 10.227 1
10.305 10.538 1
10.216 10.306 1
10.655 10.772 1
 6.678 10.140 2
 8.216  9.804 2
 8.514  9.250 2
 8.721  9.083 2
 9.018  9.703 2
 9.019  9.536 2
 9.019  9.820 2
 9.123  9.601 2
 9.124  9.498 2
 9.176  9.951 2
 9.229  9.642 2
 9.242  9.875 2
 9.268 10.405 2
 9.295  9.592 2
 9.295  9.993 2
 9.296  9.916 2
 9.529  9.942 2
 9.581  9.775 2
 9.608  9.866 2
 9.557  9.737 2
 9.454  9.751 2
 9.738 10.139 2
 9.817  9.868 2
 9.830 10.153 2
 9.908 11.213 2
 8.321  9.406 3
 8.902  9.794 3
 9.032  9.639 3
 9.433 10.195 3
 9.434 10.054 3
 9.421  9.886 3
 9.435 10.300 3
 9.591  9.655 3
 9.643 10.095 3
 9.721  9.953 3
 9.941 11.168 3
 9.941 10.910 3
10.601 10.639 3
10.885 10.924 3
 8.252  9.466 4
 8.317  9.311 4
 8.434  9.777 4
 8.409  9.364 4
 8.848 10.036 4
 9.030  9.559 4
 9.134  9.560 4
 9.160  9.806 4
 9.341  9.716 4
 9.535 10.892 4
 9.639 10.453 4
 9.730 10.492 4
 9.808 10.028 4
10.119  9.822 4
 9.913 10.055 4];
time.LL_m = data.LL_m(:,3) * 365; units.time.LL_m  = 'd'; label.time.LL_m = 'time interval';
data.LL_m = data.LL_m(:,1:2); treat.LL_m = {0};
units.LL_m  = {'cm', 'cm'};  label.LL_m = {'initial SVL', 'final SVL', 'males'};  
temp.LL_m   = C2K(24);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'RussPowe1996';

%% set weights for all real data
weights = setweights(data, []);
weights.LL_f = 3 * weights.LL_f;
weights.LL_m = 3 * weights.LL_m;
weights.tp = 2 * weights.tp;
weights.tpm = 2 * weights.tpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Embryos and larvae till stage 44 have photosynthetic symbionts within its cells and tissues, the single-celled alga Oophila amblystomatis';
metaData.bibkey.F1 = 'AmphibiaWeb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CQ4J'; % Cat of Life
metaData.links.id_ITIS = '173590'; % ITIS
metaData.links.id_EoL = '1048181'; % Ency of Life
metaData.links.id_Wiki = 'Ambystoma_maculatum'; % Wikipedia
metaData.links.id_ADW = 'Ambystoma_maculatum'; % ADW
metaData.links.id_Taxo = '47375'; % Taxonomicon
metaData.links.id_WoRMS = '1481795'; % WoRMS
metaData.links.id_amphweb = 'Ambystoma+maculatum'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ambystoma_maculatum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ambystoma_maculatum}}';
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
bibkey = 'RussPowe1996'; type = 'Article'; bib = [ ... 
'author = {Anthony P. Russell and G. Lawrence Powell and Dean R. Hall}, ' ... 
'year = {1996}, ' ...
'title = {Growth and age of {A}lberta long-toed salamanders (\emph{Ambystoma macrodsctylum krausei}): a comparison of two methods of estimation}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {74}, ' ...
'pages = {397-412}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gilb1944'; type = 'Article'; bib = [ ... 
'author = {Perry W. Gilbert}, ' ... 
'year = {1944}, ' ...
'title = {The Alga-Egg Relationship in \emph{Ambystoma maculatum}, A Case of Symbiosis}, ' ...
'journal = {Ecology}, ' ...
'volume = {25(3)}, ' ...
'pages = {366-369}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Ambystoma+maculatum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Ambystoma_maculatum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ambystoma_maculatum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


