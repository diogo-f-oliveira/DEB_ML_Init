function [data, auxData, metaData, txtData, weights] = mydata_Antimora_rostrata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Moridae';
metaData.species    = 'Antimora_rostrata'; 
metaData.species_en = 'Blue antimora'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA', 'MPS', 'MIS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};           
metaData.date_subm = [2019 03 30]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 30]; 

%% set data
% zero-variate data;

data.am = 40*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'OrloVedi2018';   
  temp.am = C2K(2.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max age found was 38 yr, but this problably underestimates max life span';

data.Lp  = 42;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase';
  comment.Lp = '41 to 43 cm, OrloVedi2018 give 19-20 yr, whcih corresponds with 51 cm';
data.Li  = 75;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb  = 2.7e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';

data.Ri = 0.9e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.5';

% uni-variate data

% time-length
data.tL= [ ... % time since birth (yr), total length (cm) 
    7 18.0
    8 22.0
    9 24.6
   10 26.1
   11 28.5
   12 31.7
   13 33.1
   14 38.4
   15 39.5
   16 42.4
   17 44.5
   18 45.5
   19 51.0
   20 51.3
   21 52.0
   22 54.0
   23 52.5
   24 54.0
   25 54.5
   26 57.0
   27 57.0
   28 58.0
   29 62.0
   30 58.2
   32 62.3
   36 68.0
   38 70.0];
data.tL(:,1) = (data.tL(:,1) + 0.75) * 365; % convert yr to d
units.tL = {'d', 'cm'};   label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(2.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OrloVedi2018';

% time-length
data.tW = [ ... % time since birth (yr), wet weight (kg)
    7 0.023
    8 0.057
    9 0.243
   10 0.117
   11 0.177
   12 0.199
   13 0.275
   14 0.341
   15 0.385
   16 0.484
   17 0.596
   18 0.643
   19 0.706
   20 0.871
   21 1.167
   22 1.163
   23 1.109
   24 1.175
   25 1.326
   26 1.403
   27 1.488
   28 1.534
   29 1.935
   30 1.352
   32 2.051
   36 2.479
   38 2.731];
data.tW(:,1) = (data.tW(:,1) + 0.75) * 365; % convert yr to d
data.tW(:,2) = data.tW(:,2) * 1e3; % convert kg to g
units.tW = {'d', 'g'};   label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(2.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'OrloVedi2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature guessed on the bases of preferred temerature as given in fishbase';
D2 = 'vliz reports large females,relative to males, but this is not confirmed by OrloVedi2018; probably due to males becoming less old';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Links
metaData.links.id_CoL = '5VLH2'; % Cat of Life
metaData.links.id_ITIS = '164672'; % ITIS
metaData.links.id_EoL = '46564965'; % Ency of Life
metaData.links.id_Wiki = 'Antimora_rostrata'; % Wikipedia
metaData.links.id_ADW = 'Antimora_rostrata'; % ADW
metaData.links.id_Taxo = '44283'; % Taxonomicon
metaData.links.id_WoRMS = '126486'; % WoRMS
metaData.links.id_fishbase = 'Antimora-rostrata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Antimora_rostrata}}';
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
bibkey = 'OrloVedi2018'; type = 'Article'; bib = [ ... 
'author = {A. M. Orlov and E. V. Vedishcheva and A. O. Trofimova and S. Yu. Orlova}, ' ... 
'year = {2018}, ' ...
'title = {Age and Growth of Blue Antimora \emph{Antimora rostrata} ({M}oridae) in Southwestern {G}reenland Waters}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'doi = {10.1134/S0032945218020108}, ' ...
'volume = {58}, ' ...
'pages = {217-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.org/summary/Antimora-rostrata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'vliz'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.vliz.be/imisdocs/publications/275769.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
