  function [data, auxData, metaData, txtData, weights] = mydata_Hemitremia_flammea
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hemitremia_flammea'; 
metaData.species_en = 'Flame chub'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 19]; 

%% set data
% zero-variate data
data.ab = 7.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Mull2012';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on hatch at 5-6 d, feeding 2 d post-hatch';
data.am = 2.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Soss1990';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Soss1990'; 
  comment.Lp = 'based on FL 4.1 cm';
data.Li = 7.8;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.1e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Mull2012';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.16^3; DenoMess1982 acutally give 0.16 mm';
data.Wwp = 0.83;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Soss1990'};
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 3.96;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

% uni-variate data
% time - length
data.tL = [ ... % time since hatch (d), total length (cm)
    0 4
    1 5.2
    2 5.6];
data.tL(:,1) = 365 * (1 + data.tL(:,1));
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'Soss1990'};

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
54 778
51 702
56 880
53 674
47 594
60 897
50 606
58 874
60 805
50 607
55 507
68 2165
55 775
68 1222
53 561
53 733
55 892
57 638
49 614
57 807
60 860
55 519
59 1179
54 346
51 617];
data.LN(:,1) = data.LN(:,1)/10; % convert mm to cm
units.LN = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
  temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = {'Soss1990'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 30;
weights.Li = weights.Li * 5;
weights.Wwi = weights.Wwi * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;
%weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3KTLR'; % Cat of Life
metaData.links.id_ITIS = '163563'; % ITIS
metaData.links.id_EoL = '994818'; % Ency of Life
metaData.links.id_Wiki = 'Hemitremia_flammea'; % Wikipedia
metaData.links.id_ADW = 'Hemitremia_flammea'; % ADW
metaData.links.id_Taxo = '176470'; % Taxonomicon
metaData.links.id_WoRMS = '1020139'; % WoRMS
metaData.links.id_fishbase = 'Hemitremia-flammea'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hemitremia_flammea}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hemitremia-flammea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mull2012'; type = 'Article'; bib = [ ... 
'author = {Bob Muller}, ' ... 
'year = {2012}, ' ...
'title = {Observations of Flame Chub Spawning, Egg and Larva Development}, ' ...
'journal = {American Currents}, ' ...
'volume = {37(1)}, ' ...
'pages = {13-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Soss1990'; type = 'phdthesis'; bib = [ ... 
'author = {Marcia K. Sossamon}, ' ... 
'year = {1990}, ' ...
'title = {The Life History of the Flame Chub, \emph{Hemitremia flammea} ({J}ordan and {G}ilbert), in {P}ond {C}reek, {L}oudon {C}ounty, {T}ennessee}, ' ...
'school = {University of Tennessee, Knoxville}, ' ...
'howpublished = {\url{https://trace.tennessee.edu/utk_gradthes/2695}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  