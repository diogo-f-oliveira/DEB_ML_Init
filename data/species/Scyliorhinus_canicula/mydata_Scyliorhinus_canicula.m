function [data, auxData, metaData, txtData, weights] = mydata_Scyliorhinus_canicula

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Scyliorhinidae';
metaData.species    = 'Scyliorhinus_canicula'; 
metaData.species_en = 'Small-spotted catshark'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'GSI'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'Ww-JO'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 18]; 

%% set data
% zero-variate data;
data.ab = 300;    units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'RodrSanc2005';    
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps of all data are guessed';
data.ap = 3*365;  units.ap = 'd';      label.ap = 'age at puberty';           bibkey.ap = 'RodrSanc2005';
  comment.ap = 'AnAge 2791 d (females), 1642 d (males)';
  temp.ap = C2K(16); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 12*365; units.am = 'd';       label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';   bibkey.Lb  = 'RodrSanc2005';
data.Lp  = 40;    units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'RodrSanc2005';
  comment.Lp = 'female (36.4-46.7), male: 37.1-48.8 cm; fishbase: 57 cm (41 - 64 cm)'; 
data.Li  = 100;   units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.3;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'estimated from (Lb/Li)^3 * Wwi';
data.Wwp = 85;    units.Wwp = 'g';     label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess'; 
  comment.Wwp = 'estimated from (Lp/Li)^3 * Wwi';
data.Wwi = 1320;  units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'AnAge 726 g';

data.Ri  = 45.5/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
data.GSI  = 0.07; units.GSI  = '-';  label.GSI  = 'gonadosomatix index at 47 cm ';  bibkey.GSI  = 'CapaReyn2008';   
  temp.GSI = C2K(16); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% weight-standard metabolic rate, no swimming, digestion
data.WO = [ ... weight (g), mg O2/h from Sims96
2.819581	0.182651
2.917055	0.232808
3.399111	0.348895
3.576890	0.361228
3.669236	0.249612
3.669237	0.303773
4.239418	0.419877
10.258175	0.911769
10.433984	0.757931
10.794694	0.723748
11.456200	0.812452
12.261988	0.850969
13.013411	1.012064
14.533212	0.803441
16.230508	1.162971
56.593627	4.298984
167.916066	11.630376
169.348864	8.036460
214.834152	12.185394
220.380636	9.451271
222.261105	11.110420
222.261106	13.997966
580.547338	24.129492
653.880152	21.501430
653.880153	27.722681
659.459596	43.000831
665.086647	41.059734
670.761714	31.480215
670.761715	35.745521
682.257533	24.136007
711.866448	18.505961
724.066739	20.298211
749.098186	16.488512
755.490108	14.689953
761.936571	42.028928
781.607881	37.445497
801.787056	45.049053
836.583366	42.035497
850.921112	30.070703
918.543294	23.870673];
units.WO = {'g', 'mg O2/h'};     label.WO = {'wet weight', 'O_2 consumption'};
  temp.WO = C2K(16);  units.temp.WO = 'K'; label.temp.WO = 'temperature';
bibkey.WO = 'Sims1996';

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.000000	9.534198
0.987486	25.976881
2.022753	37.778273
3.026166	46.568626
4.045506	51.972025
5.064846	55.870048
6.036405	58.387714
7.071672	60.153263
8.043231	61.792793
9.110353	62.053251
10.050057	62.688912
11.069397	63.576182
12.025028	64.462881
13.092150	64.723339
14.079636	64.481291];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(16); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RodrSanc2005';

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

%% Links
metaData.links.id_CoL = '4W56Z'; % Cat of Life
metaData.links.id_ITIS = '160065'; % ITIS
metaData.links.id_EoL = '46559871'; % Ency of Life
metaData.links.id_Wiki = 'Scyliorhinus_canicula'; % Wikipedia
metaData.links.id_ADW = 'Scyliorhinus_canicula'; % ADW
metaData.links.id_Taxo = '106399'; % Taxonomicon
metaData.links.id_WoRMS = '105814'; % WoRMS
metaData.links.id_fishbase = 'Scyliorhinus-canicula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Small-spotted_catshark}}';
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
bibkey = 'Sims1996'; type = 'Article'; bib = [ ...
'author = {Sims, D. W.}, ' ...
'year = {1996}, ' ...
'title  = {The effect of body size on the standard metabolic rate of the lesser spotted dogfish}, ' ...
'journal = {J. Fish Biol}, ' ...
'volume = {48}, ' ...
'pages = {542--544}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CapaReyn2008'; type = 'Article'; bib = [ ... 
'author = {C. Capap\''{e} and C. Reynaud and Y. Vergne and J.-P. Quignard}, ' ...
'year = {2008}, ' ...
'title  = {Biological observations on the smallspotted catshark \emph{Scyliorhinus canicula} ({C}hondrichthyes: {S}cyliorhinidae) off the {L}anguedocian coast (southern {F}rance, northern {M}editerranean)}, ' ...
'journal = {Pan-American Journal of Aquatic Sciences}, ' ...
'volume = {3}, ' ...
'pages = {282--289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrSanc2005'; type = 'Article'; bib = [ ... 
'author = {C. Rodr\''{i}guez-Cabello and F. S\''{a}nchez and F. Velasco}, ' ...
'year = {2005}, ' ...
'title  = {Growth of Lesser Spotted Dogfish (\emph{Scyliorhinus canicula} {L}., 1758) in the {C}antabrian {S}ea, Based on Tag-recapture Data}, ' ...
'journal = {J. Northw. Atl. Fish. Sci.}, ' ...
'volume = {35}, ' ...
'pages = {131-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Scyliorhinus_canicula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Scyliorhinus_canicula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Country/CountrySpeciesSummary.php?c_code=196&id=845}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  