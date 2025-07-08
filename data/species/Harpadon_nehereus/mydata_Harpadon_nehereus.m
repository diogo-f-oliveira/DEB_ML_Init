function [data, auxData, metaData, txtData, weights] = mydata_Harpadon_nehereus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Harpadon_nehereus'; 
metaData.species_en = 'Bombay duck'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 28]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 28]; 

%% set data
% zero-variate data
data.am = 3*365;   units.am = 'd';    label.am = 'life span';                             bibkey.am = 'FirdSoem2017';  
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.4;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females';    bibkey.Lp = 'Ghos2014';
data.Li = 38.5;   units.Li = 'cm';   label.Li = 'ultimate total length for females';      bibkey.Li = 'FirdSoem2017';
data.Lim = 37.7;  units.Lim = 'cm';  label.Lim = 'ultimate total length for males';       bibkey.Lim = 'FirdSoem2017';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                  bibkey.Wwb = 'barcode';
  comment.Wwb = 'based on egg diameter of 0.9 mm: 4/3*pi*0.045^3';
data.Wwi = 233; units.Wwi = 'g';   label.Wwi = 'wet weight at 33 cm total length female'; bibkey.Wwi = 'FirdSoem2017';
data.Wwim = 150; units.Wwim = 'g';   label.Wwim = 'wet weight at 31 cm total length male';bibkey.Wwim = 'FirdSoem2017';

data.Ri = 6*71507/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';                     bibkey.Ri = 'Ghos2014';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on 10^3.0116 * Wwi^0.7784 per spawn; fishbase: spawns 6 times per yr';

% uni-variate data
% LdL data for females
data.LdL_f = [ ... % total length (cm) ~ growth in total length (cm/d) 
19.888	0.312
23.836	0.250
26.434	0.138
28.531	0.149
30.747	0.162];
units.LdL_f = {'cm', 'cm/d'}; label.LdL_f = {'total length', 'change in total length', 'female'};  
temp.LdL_f = C2K(28);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'FirdSoem2017';
comment.LdL_f = 'data for females';
% LdL data for males
data.LdL_m = [ ... % total length (cm) ~ growth in total length (cm/d) 
17.258	0.313
21.268	0.257
24.125	0.145
26.265	0.158
28.601	0.171];
units.LdL_m = {'cm', 'cm/d'}; label.LdL_m = {'total length', 'change in total length', 'male'};  
temp.LdL_m = C2K(28);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'FirdSoem2017';
comment.LdL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Preferred temperature 28 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'benthopelagic; very phosphorescent';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3JS7N'; % Cat of Life
metaData.links.id_ITIS = '162425'; % ITIS
metaData.links.id_EoL = '46563988'; % Ency of Life
metaData.links.id_Wiki = 'Harpadon_nehereus'; % Wikipedia
metaData.links.id_ADW = 'Harpadon_nehereus'; % ADW
metaData.links.id_Taxo = '42986'; % Taxonomicon
metaData.links.id_WoRMS = '217661'; % WoRMS
metaData.links.id_fishbase = 'Harpadon-nehereus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Harpadon_nehereus}}';
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
bibkey = 'FirdSoem2017'; type = 'article'; bib = [ ...
'author = {M. Firdaus and S. Soemarno and G. Bintoroc and dan Tri Djoko Lelonod}, ' ... 
'year   = {2017}, ' ...
'title  = {Growth and Age Structure of Nomei (\emph{Harpadon nehereus}, {H}am. 1822) in {J}uata {L}aut Waters of {T}arakan {I}sland, {N}orth {B}orneo, {I}ndonesian}, ' ...
'journal = {International Journal of Sciences: Basic and Applied Research (IJSBAR)}, ' ...
'page = {208--218}, ' ...
'volume = {31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ghos2014'; type = 'article'; bib = [ ...
'author = {S. Ghosh}, ' ... 
'year   = {2014}, ' ...
'title  = {Fishery, reproductive biology and diet characteristics of Bombay duck \emph{Harpadon nehereus} from the {S}aurashtra coast }, ' ...
'journal = {Indian Journal of Marine Sciences}, ' ...
'page = {418--426}, ' ...
'volume = {43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/260}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'barcode'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.barcodeoflife.org/psa/collections/Cryobanking_13.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

