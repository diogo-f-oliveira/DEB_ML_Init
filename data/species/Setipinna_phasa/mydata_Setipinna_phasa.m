function [data, auxData, metaData, txtData, weights] = mydata_Setipinna_phasa

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Setipinna_phasa'; 
metaData.species_en = 'Gangetic hairfin anchovy'; 

metaData.ecoCode.climate = {'MB','Cwa'};
metaData.ecoCode.ecozone = {'MIN','TPi'};
metaData.ecoCode.habitat = {'piMpe','biFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCik'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 22];

%% set data
% zero-variate data
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365; units.am = 'd';    label.am = 'life span';          bibkey.am = 'AlagJhin1976';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;     units.Lp = 'cm';   label.Lp = 'std length at puberty';bibkey.Lp = 'guess';
data.Li = 40;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'AlagJhin1976';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 37.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00417*Lp^3.09, see F1';
data.Wwi = 372;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00417*Li^3.09, see F1';

data.Ri  = 24e3/365;   units.Ri  = '#/d';  label.Ri  = 'max reprod rate'; bibkey.Ri  = 'AlagJhin1976';  
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since birth (yr), total length (cm)
    1  7.60
    2 12.19
    3 16.28
    4 20.16
    5 23.16
    6 25.94
    7 28.54
    8 30.33];
data.tL(:,1) = (0.3 + data.tL(:,1)) * 365;
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'AlagJhin1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Tempertures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00417*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4X2WQ'; % Cat of Life
metaData.links.id_ITIS = '551428'; % ITIS
metaData.links.id_EoL = '46562704'; % Ency of Life
metaData.links.id_Wiki = 'Setipinna_phasa'; % Wikipedia
metaData.links.id_ADW = 'Setipinna_phasa'; % ADW
metaData.links.id_Taxo = '187521'; % Taxonomicon
metaData.links.id_WoRMS = '282767'; % WoRMS
metaData.links.id_fishbase = 'Setipinna-phasa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Setipinna_phasa}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...Photopectoralis-bindus
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlagJhin1976'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0044-8486(76)90058-2}, ' ...
'author = {K. Alagaraja and A.G. Jhingran}, ' ...
'year = {1976}, ' ...
'title = {Application of Von {B}ertalanffy''s growth model to \emph{Setipinna phasa} ({H}amilton) when growth is allometric}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {9}, '...
'pages = {181–186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlagJhin1976'; type = 'Article'; bib = [ ... 
'doi = {10.4194/1303-2712-v21_4_03}, ' ...
'author = {Brijesh Kumar Chaubey and Farah Bano and Mohammad Serajuddin}, ' ...
'year = {2021}, ' ...
'title = {Comparative Study of Reproductive Traits in {G}angetic Hairfin Anchovy, \emph{Setipinna phasa} ({H}amilton, 1822) from Estuarine and Freshwater Ecosystems}, ' ... 
'journal = {Turk. J. Fish.& Aquat. Sci.}, ' ...
'volume = {21(4)}, '...
'pages = {179-189}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Setipinna-phasa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  