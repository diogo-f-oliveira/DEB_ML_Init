function [data, auxData, metaData, txtData, weights] = mydata_Leptodactylus_fallax

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Leptodactylidae';
metaData.species    = 'Leptodactylus_fallax'; 
metaData.species_en = 'Mountain chicken'; 

metaData.ecoCode.climate = {'Am', 'Af', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tntm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 14];

%% set data
% zero-variate data

data.aj = 45; units.aj = 'd';    label.aj = 'age at metam';                bibkey.aj = 'Wiki';   
  temp.aj = C2K(27);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
data.ap = 3*365; units.ap = 'd';    label.ap = 'age at puberty';                bibkey.ap = 'Wiki';   
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
data.am = 12*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.98;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'amphibiaweb';
  comment.Lj = 'TL 11 cm, fraction 0.79-0.84 is tail';
data.Li  = 28;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'GuarGarc2014';
data.Lim = 20;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'guess';
  comment.Lim = 'based on males being smaller than females';

data.Wwb = 1.41e-2; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 2.06e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = {'Wiki','GuarGarc2014'};
  comment.Wwi = 'based on 1 kg for Li 22 cm: (28/22)^3*1e3';

data.Ri  = 25e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'unfertized (trophic) eggs to feed the tadpoles; 26-43 froglets leave the nest';

% uni-variate data
% time-length
data.tL_fm = [ ... % LAG (#), SVL (cm)
3	17.012 14.019
3	12.961 NaN
4	13.367 14.644
4	14.863 19.060
4	17.017 NaN
4	15.265 NaN
4	15.557 NaN
5	17.021 NaN
5	16.875 NaN
5	16.036 NaN
5	16.547 NaN
5	14.539 NaN
5	15.014 NaN
6	17.464 14.033
6	16.478 NaN
6	23.449 NaN
7	28.089 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.8) * 365; % convert LAG to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time', 'SVL'};  
temp.tL_fm    = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'GuarGarc2014'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Only wild individuals were selected';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males dig a burrow and make foam nest in ; tadpoles are fed with unfertilized eggs'; 
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TN4N'; % Cat of Life
metaData.links.id_ITIS = '207744'; % ITIS
metaData.links.id_EoL = '1048167'; % Ency of Life
metaData.links.id_Wiki = 'Leptodactylus_fallax'; % Wikipedia
metaData.links.id_ADW = 'Leptodactylus_fallax'; % ADW
metaData.links.id_Taxo = '140884'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Leptodactylus+fallax'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptodactylus_fallax}}';
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
bibkey = 'GuarGarc2014'; type = 'Article'; bib = [ ...  
'author = {Fabio Maria Guarino and Gerardo Garcia and Franco Andreone}, ' ...
'year = {2014}, ' ...
'title  = {Huge but moderately long-lived: age structure in the mountain chicken, \emph{Leptodactylus fallax}, from {M}ontserrat, {W}est {I}ndies}, ' ...
'journal = {Herpetological Journal}, ' ...
'volme = {24}, ' ...
'pages = {167–173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Leptodactylus+fallax}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1048167}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

