function [data, auxData, metaData, txtData, weights] = mydata_Maiasaura_peeblesorum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Ornithischia'; 
metaData.family     = 'Hadrosauridae';
metaData.species    = 'Maiasaura_peeblesorum'; 
metaData.species_en = 'Maiasaura'; 

metaData.ecoCode.climate = {'BS', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Ww_t';'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2021 08 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'WoodFree2015';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 41;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki';
 comment.Lb = '11-13 cm';
data.Li  = 900;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Ww1 = 0.384e6; units.Ww1 = 'g';   label.Ww1 = 'wet weight at 1 yr';     bibkey.Ww1 = 'WoodFree2015';
data.Wwp = 1.632e6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'WoodFree2015';
data.Ww8 = 2.300e6; units.Ww8 = 'g';   label.Ww8 = 'wet weight at 8 yr';     bibkey.Ww8 = 'WoodFree2015';
data.Wwi = 3.500e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'dinosaurjungle';
  comment.Wwi = 'Estimate based on etrapolation of growth curve';
  
data.Ri  = 2*35/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative';

data.wR = 10; units.wR = 'g/mol';   label.wR = 'neonate mass per O2';             bibkey.wR = 'Kooy2021';

% uni-variate data
% t-W data
data.tW_T50 = [ ... % time since birth (yr), wet weight (kg)
0.000	3.800
1.129	479.536
1.929	1150.550
2.949	1517.305
3.970	1748.795
4.990	2104.278
5.975	2352.662
6.959	2674.314
7.962	2855.072
12.979	3229.072];
units.tW_T50  = {'yr', 'kg'};  label.tW_T50 = {'time since birth', 'wet weight'};  
temp.tW_T50   = C2K(37);  units.temp.tW_T50 = 'K'; label.temp.tW_T50 = 'temperature';
bibkey.tW_T50 = 'WoodFree2015';
%
data.tW_T43 = [ ... % time since birth (yr), wet weight (kg)
0.000	3.800
1.075	411.881
2.021	1060.410
2.967	1562.401
3.969	2019.326
4.989	2402.989
5.992	2600.656
6.958	2803.943];
units.tW_T43  = {'yr', 'kg'};  label.tW_T43 = {'time since birth', 'wet weight'};  
temp.tW_T43   = C2K(37);  units.temp.tW_T43 = 'K'; label.temp.tW_T43 = 'temperature';
bibkey.tW_T43 = 'WoodFree2015';
%
data.tW_T34 = [ ... % time since birth (yr), wet weight (kg)
0.000	3.800
0.983	541.473
1.984	975.854
2.968	1455.316
3.971	1607.894];
units.tW_T34  = {'yr', 'kg'};  label.tW_T34 = {'time since birth', 'wet weight'};  
temp.tW_T34   = C2K(37);  units.temp.tW_T34 = 'K'; label.temp.tW_T34 = 'temperature';
bibkey.tW_T34 = 'WoodFree2015';
%
data.tW_T33 = [ ... % time since birth (yr), wet weight (kg)
0.000	3.800
0.965	462.561
2.003	896.956
2.968	1308.778
3.972	1427.540
4.993	1551.944];
units.tW_T33  = {'yr', 'kg'};  label.tW_T33 = {'time since birth', 'wet weight'};  
temp.tW_T33   = C2K(37);  units.temp.tW_T33 = 'K'; label.temp.tW_T33 = 'temperature';
bibkey.tW_T33 = 'WoodFree2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 10 * weights.Wwi;
weights.Lb = 4 * weights.Lb;
weights.Li = 4 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_T50','tW_T43','tW_T34','tW_T33'}; subtitle1 = {'Data for T50, T43, T34, T33'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Neonate growth is possibly retarted by lower body temperature';
D2 = 'mod_1: w_R is added to reduce degrees of freedom, but the reprod rate must substantially be increased to match w_R';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = ''; % Cat of Life no present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47459924'; % Ency of Life
metaData.links.id_Wiki = 'Maiasaura_peeblesorum'; % Wikipedia
metaData.links.id_Taxo = '4937155'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Maiasaura}}';
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
bibkey = 'WoodFree2015'; type = 'Article'; bib = [ ... 
'author = {H. N. Woodward and E. A. Freedman Fowler and J. O. Farlow and J. R. Horner}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Maiasaura}, a model organism for extinct vertebrate population biology: a large sample statistical assessment of growth dynamics and survivorship}, ' ...
'journal = {Paleobiol.}, ' ...
'volume = {41}, ' ...
'pages = {503--527}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'dinosaurjungle'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.dinosaurjungle.com/dinosaur_species_maiasaura.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2021'; type = 'Misc'; bib = [ ...
'author = {Kooijman, S. A. L. M.}, ' ...
'note = {newly discover pattern among animals}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


