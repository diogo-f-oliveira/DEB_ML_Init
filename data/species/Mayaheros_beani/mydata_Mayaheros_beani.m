function [data, auxData, metaData, txtData, weights] = mydata_Mayaheros_beani
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Mayaheros_beani'; 
metaData.species_en = 'Green guapote'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr','0iMm','0iMc'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 20];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 22.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'GarcSoto2011'; 
  comment.Lp = 'based on SL 18.9 cm and F2';
data.Li  = 30;     units.Li = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Oreochromis niloticus: 4/3*pi*0.075^3';
data.Wwp = 198;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'GarcSoto2011','fishbase'};
  comment.Wwp = 'based on 0.01514*Lp^3.04, see F1';
data.Wwi = 468;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Lim^3.04, see F1';

data.Ri  = 3000/360; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative fecundity, compared to Mayaheros urophthalmus: 6615*(30/39)^3';
 
% uni-variate data

% time-weight
data.tWw = [ ... % time (d), wetweight (g)
0.000	8.492
6.978	10.533
13.894	13.526
20.949	17.578
28.070	25.651
34.907	36.897
41.955	46.981];
units.tWw   = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw    = C2K(30);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'MartVald2014';

%% set weights for all real data
weights = setweights(data, []);
weights.Lp = 10 * weights.Lp;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.835 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3YH5J'; % Cat of Life
metaData.links.id_ITIS = '169803'; % ITIS
metaData.links.id_EoL = '52229108'; % Ency of Life
metaData.links.id_Wiki = 'Mayaheros'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5493863'; % Taxonomicon
metaData.links.id_WoRMS = '1467672'; % WoRMS
metaData.links.id_fishbase = 'Mayaheros-beani'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mayaheros}}';
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
bibkey = 'MartVald2014'; type = 'Article'; bib = [ ...
'doi = {103856/vol42-issue3-fulltext-20}, ' ...
'author = {Leonardo Martinez-Cardenas and Edna F. Valdez-Hern\''{a}ndez and Alfonso A. Gonz\''{a}lez-Diaz and Miriam Soria-Barreto and Maria R. Casta\~{n}eda-Chavez and Javier M. Ruiz-Velazco and Emilio Pe\~{n}a-Messina and Agustin Robles-Bermudez}, ' ... 
'year = {2014}, ' ...
'title = {Preliminary observations on \emph{Cichlasoma beani} in culture conditions}, ' ...
'journal = {Lat. Am. J. Aquat. Res.}, ' ...
'volume = {42(3)}, ' ...
'pages = {639-643}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GarcSoto2011'; type = 'Article'; bib = [ ...
'doi = {10.1590/S1679-62252011005000035}, ' ...
'author = {Melgen A. Garc\''{i}a-Liz\''{a}rraga and Francisco Enrique Soto-Franco and Javier Marcial de Jes\''{u}s and Ruiz Velazco-Arce and Jos\''{e} Iv\''{a}n Vel\''{a}zquez-Abunader and Jorge Sa\''{u}l Ram\''{i}rez-P\''{e}rez and Emilio Pe\~{n}a-Messina}, ' ... 
'year = {2011}, ' ...
'title = {Population structure and reproductive behavior of {S}inaloa cichlid \emph{Cichlasoma beani} ({J}ordan, 1889) in a tropical reservoir}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {9(3)}, ' ...
'pages = {593-599}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mayaheros-beani.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

