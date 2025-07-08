function [data, auxData, metaData, txtData, weights] = mydata_Eleginus_gracilis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Eleginus_gracilis'; 
metaData.species_en = 'Saffron cod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'}; 
metaData.date_subm = [2019 03 25]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 25]; 

%% set data
% zero-variate data
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(0.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 55;    units.Li = 'cm';   label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.15  mm for Polloachius virens: pi/6*0.115^3';
data.Wwp = 357;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00661*Lp^3.02, see F1';
data.Wwi = 1.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00661*Li^3.02, see F1';

data.Ri = 680e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(0.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length data 
data.tL = [ ... % age class (yr) ~ Length (cm) 
3.012	32.762
3.988	38.056
4.988	40.450
5.976	42.660
6.965	45.882
7.953	46.159
8.941	46.665
9.941	47.033];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.8); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(0.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dats2016';

% time-weight data 
data.tW = [ ... % age class (yr) ~ weight (g) 
3.013	281.841
3.992	441.432
4.982	560.102
5.983	676.726
6.962	844.501
7.986	846.547
8.975	871.100
9.964	944.757];
data.tW(:,1) = 365 * (data.tW(:,1) + 0.8); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(0.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Dats2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: 0.00676*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3972L'; % Cat of Life
metaData.links.id_ITIS = '164708'; % ITIS
metaData.links.id_EoL = '46564409'; % Ency of Life
metaData.links.id_Wiki = 'Eleginus_gracilis'; % Wikipedia
metaData.links.id_ADW = 'Eleginus_gracilis'; % ADW
metaData.links.id_Taxo = '44304'; % Taxonomicon
metaData.links.id_WoRMS = '254537'; % WoRMS
metaData.links.id_fishbase = 'Eleginus-gracilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eleginus_gracilis}}';
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
bibkey = 'Dats2016'; type = 'article'; bib = [ ...
'author = {A. V. Datsky}, ' ... 
'year   = {2016}, ' ...
'title  = {Biological features of the Common Fish Species in {O}lyutorsky-{N}avarin Region and the Adjacent Waters of the {B}ering {S}ea: 1. {G}adidae (Cods) Family}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'page = {868-889}, ' ...
'volume = {56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Eleginus-gracilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

