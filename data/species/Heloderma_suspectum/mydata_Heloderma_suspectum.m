function [data, auxData, metaData, txtData, weights] = mydata_Heloderma_suspectum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Helodermatidae';
metaData.species    = 'Heloderma_suspectum'; 
metaData.species_en = 'Gila monster'; 

metaData.ecoCode.climate = {'BSh', 'BWh', 'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvbe', 'biCi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 24];

%% set data
% zero-variate data

data.ab = 10*30.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'ADW';   
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 28.9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 11;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'SmitAmar2010';
data.Lp  = 23.9;     units.Lp = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'SmitAmar2010';  
data.Li  = 36;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';  bibkey.Li  = 'Wiki';  

data.Wwi = 700;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = 'the very largest individual was 2300 g';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(26);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 to 12 young per clutch,1 clutch per yr';

% univariate data
% length - change in length
data.LdL = [ ... % SVL (cm), change in SVL  (cm/d)
12.44180	0.03842
13.40702	0.06842
13.67429	0.06289
14.29947	0.04868
17.09489	0.03763
17.17056	0.04737
19.28345	0.02500
20.39436	0.04184
20.83097	0.04026
22.80488	0.02526
24.14661	0.03053
24.46621	0.01737
26.41098	-0.01000
27.21968	0.00500
27.22899	0.03447
27.25004	0.01632
28.13242	0.00526
28.31213	0.00026
28.44104	0.00158
28.56659	0.00579
28.65416	0.00526
29.04790	0.00316
29.05095	0.00053
29.22517	0.00026
29.78703	0.00316
29.99344	0.01263
30.09352	0.00132
30.30786	0.00395
30.43585	0.00605
30.48848	-0.00184
30.55698	-0.02342
30.61678	0.00000
30.73928	0.00684
30.77269	0.01553
30.83905	-0.00421
30.97956	-0.01289
31.09779	-0.00237
31.17254	0.00816
32.20000	-0.01553
32.30481	0.00658];
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'SVL', 'chnage in SVL'};  
temp.LdL   = C2K(26);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'SmitAmar2010';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3KGXZ'; % Cat of Life
metaData.links.id_ITIS = '174113'; % ITIS
metaData.links.id_EoL = '456548'; % Ency of Life
metaData.links.id_Wiki = 'Heloderma_suspectum'; % Wikipedia
metaData.links.id_ADW = 'Heloderma_suspectum'; % ADW
metaData.links.id_Taxo = '49723'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Heloderma&species=suspectum'; % ReptileDB
metaData.links.id_AnAge = 'Heloderma_suspectum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heloderma_suspectum}}';
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
bibkey = 'SmitAmar2010'; type = 'Article'; bib = [ ... 
'author = {Jeffrey J. Smith and Melissa Amarello and Matt Goode}, ' ... 
'year = {2010}, ' ...
'title = {Seasonal Growth of Free-Ranging Gila Monsters (\emph{Heloderma suspectum}) in a {S}outhern {A}rizona Population}, ' ...
'pages = {484-488}, ' ...
'volume = {44(3)}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Heloderma_suspectum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Heloderma_suspectum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


