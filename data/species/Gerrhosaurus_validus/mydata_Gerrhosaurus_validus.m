function [data, auxData, metaData, txtData, weights] = mydata_Gerrhosaurus_validus
%% set metadata
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Gerrhosauridae';
metaData.species    = 'Gerrhosaurus_validus';
metaData.species_en = 'Giant plated lizard';

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww','t-L', 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 25];              
metaData.email   = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'};
metaData.date_acc    = [2019 06 25];

%% set data
% zero-variate data;
data.ab = 104.5;     units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'BoycMorg1988';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17.2*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 7.4;     units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'BoycMorg1988';
data.Lp  = 16;      units.Lp  = 'cm';    label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 27.75;     units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Wiki';
comment.Li = 'based on TL 75 cm, using F1';

data.Wwb = 11;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'BoycMorg1988';
data.Wwi = 653.91;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'EoL';

data.Ri  = 4/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BoycMorg1988';
temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), SVL (cm)
      1   7.4
     94  10.5
    186  11.5
    312  16.3
    510  18.5];    
units.tL = {'d', 'cm'};     label.tL = {'age', 'SVL'};  
temp.tL   = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BoycMorg1988';
%
data.tL1 = [ ... % time since birth (d), SVL (cm)
    1  7.4
   94 10.7
  186 10.9
  312 15.8
  510 20.2];    
units.tL1 = {'d', 'cm'};     label.tL1 = {'age', 'SVL'};  
temp.tL1   = C2K(30);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BoycMorg1988';

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
      1   11
     94   44
    186   55
    312  128
    510  218];    
units.tW = {'d', 'g'};     label.tW = {'age', 'weight'};  
temp.tW   = C2K(30);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BoycMorg1988';
%
data.tW1 = [ ... % time since birth (d), weight (g)
    1  10
   94  45
  186  48
  312 130
  510 244];    
units.tW1 = {'d', 'g'};     label.tW1 = {'age', 'weight'};  
temp.tW1   = C2K(30);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'BoycMorg1988';

% length-weight
data.LW = [[data.tL(:,2), data.tW(:,2)]; [data.tL1(:,2), data.tW1(:,2)]];
units.LW = {'cm', 'g'};     label.LW = {'SVL', 'weight'};  
bibkey.LW = 'BoycMorg1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;
weights.tW = 3 * weights.tW;
weights.tW1 = 3 * weights.tW1;

%% overwriting weights
weights.tL = 3 * weights.tL; 
weights.tL1 = 3 * weights.tL1; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for individual 1,2'};
set2 = {'tW','tW1'}; subtitle2 = {'Data for individual 1,2'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'SL = 0.37*TL';
metaData.bibkey.F1 = 'BoycMorg1988'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '736Q8'; % Cat of Life
metaData.links.id_ITIS = '1141855'; % ITIS
metaData.links.id_EoL = '794201'; % Ency of Life
metaData.links.id_Wiki = 'Gerrhosaurus_validus'; % Wikipedia
metaData.links.id_ADW = 'Gerrhosaurus_validus'; % ADW
metaData.links.id_Taxo = '49531'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Gerrhosaurus&species=validus'; % ReptileDB
metaData.links.id_AnAge = 'Gerrhosaurus_validus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gerrhosaurus_validus}}';  
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
bibkey = 'BoycMorg1988'; type = 'Article'; bib = [ ...
'doi = {10.1080/04416651.1988.9650202}, ' ...
'author = {Richard C. Boycott and David R. Morgan}, ' ...
'title = {REPRODUCTIVE AND GROWTH DATA OF SOME {S}OUTH {A}FRICAN LIZARDS}, ' ...
'journal = {The Journal of the Herpetological Association of Africa}, ' ...
'volume = {35(1)}, ' ...
'pages = {15-18}, ' ...
'year = {1988}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794201}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Gerrhosaurus_validus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


