function [data, auxData, metaData, txtData, weights] = mydata_Centracanthus_cirrus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Centracanthus_cirrus'; 
metaData.species_en = 'Curled picarel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd', 'jiFe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 18]; 

%% set data
% zero-variate data

data.am = 8*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'OzayBile2000';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'guess';
data.Li  = 34;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.02 mm: pi/6*.102^3';

data.Ri  = 5.5e4/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 10.26
    2 12.84
    3 13.98
    4 15.12
    5 15.85]; 
data.tL(:,1) = (1 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OzayBile2000';

% time - weight
data.tWw = [ ... % time since birth (yr), wet weight (g)
    1  7.49
    2 14.92
    3 19.18
    4 25.72
    5 30.8]; 
data.tWw(:,1) = (1 + data.tL(:,1)) * 365; % convert yr to d
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(12);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'OzayBile2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tWw = 5 * weights.tWw;
weights.Lp = 5 * weights.Lp;
weights.Li = 5 * weights.Li;
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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5XGGF'; % Cat of Life
metaData.links.id_ITIS = '647923'; % ITIS
metaData.links.id_EoL = '46578156'; % Ency of Life
metaData.links.id_Wiki = 'Centracanthus_cirrus'; % Wikipedia
metaData.links.id_ADW = 'Centracanthus_cirrus'; % ADW
metaData.links.id_Taxo = '166673'; % Taxonomicon
metaData.links.id_WoRMS = '126827'; % WoRMS
metaData.links.id_fishbase = 'Centracanthus-cirrus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centracanthus_cirrus}}';
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
bibkey = 'OzayBile2000'; type = 'article'; bib = [ ...  
'author = {Okan Ozaydin and Murat Bilecenoglu and Murat Kaya}, ' ...
'year = {2000}, ' ...
'title  = {Age and growth of the curled picarel \emph{Centracanthus cirrus} {R}afinesque, 1810 ({O}steichthyes: {C}centracanthidae) in {N}orthern {C}yprus, {E}astern {M}editerranean {S}ea}, ' ...
'journal = {Acta Adriat.}, ' ...
'volume = {42(2)}, ' ...
'pages = {35-42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Centracanthus-cirrus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

