function [data, auxData, metaData, txtData, weights] = mydata_Aptenodytes_forsteri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Aptenodytes_forsteri'; 
metaData.species_en = 'Emperor penguin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'TS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tncm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 03 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 70;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from PTAG2005';
data.tx = 170;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Ston1953';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '150 d according to ADW';
data.tp = 510;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '150 d according to ADW';
data.tR = 4.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Wiki';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 50*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '20 yrs in the field';

data.Ww0 = 0.84*460;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'Wiki';
  comment.Ww0 = '15.7 percent is egg shell';
data.Wwb = 315;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 45e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'EoL';

data.Ri  = 0.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight^(1/3) (g^(1/3))
    0          7.320385116;
	10.44125662 10.09706669;
	22.56117196 10.24946486;
	31.97297809 9.851275075;
	32.55990937 10.27370655;
	33.72753846 10.13901007;
	34.47573882 10.88323232;
	35.55287222 11.10612714;
	37.50520797 11.14636965;
	38.63701035 11.28090604;
	39.89929079 11.44165788;
	41.76386871 11.25262564;
	45.81694142 11.53137741;
	48.77014191 11.67552929;
	52.40144898 11.58447096;
	59.78171236 12.53171671;
	63.96044744 13.09703016;
	71.69170308 13.73470393;
	74.87027254 14.50939311;
	77.66681917 14.98920543;
	83.00698896 15.66693392;
	85.58212179 17.08704599;
	90.07006758 18.16800539;
	90.92049238 18.97379916;
	92.87490595 19.34056148;
	94.90327081 19.19091591;
	98.3328864 19.00318397;
	102.0560874 19.18110454;
	105.2948407 19.92037415;
	108.0093838 20.53272411;
	110.7680259 20.95524948;
	113.3031568 21.37821932;
	113.9916134 21.54893722;
	115.1431772 21.87317121;
	116.9310464 22.17407743;
	119.6777398 22.48190193;
	123.268864  22.92483429;
	125.9507583 22.61062716;
	130.2292    23.51991623;
	132.4808365 23.06095266;
	136.0583937 23.06707591;
	137.0817577 22.77381682;
	142.0458595 22.6006834;
	145.1139127 22.62105728;
	152.4121336 22.47416971;
	156.4362535 22.47499245;
	157.3569531 22.72908575;
	161.4176184 23.38729619;
	163.526608 23.09187827;
	168.1089656 24.15941247;
	172.3570563 24.16420231];
data.tW(:,2) = data.tW(:,2).^3; % remove cubic root transform
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Ston1953';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'FYD9'; % Cat of Life
metaData.links.id_ITIS = '174449'; % ITIS
metaData.links.id_EoL = '45512074'; % Ency of Life
metaData.links.id_Wiki = 'Aptenodytes_forsteri'; % Wikipedia
metaData.links.id_ADW = 'Aptenodytes_forsteri'; % ADW
metaData.links.id_Taxo = '51391'; % Taxonomicon
metaData.links.id_WoRMS = '225773'; % WoRMS
metaData.links.id_avibase = '58848B7175EB4B3C'; % avibase
metaData.links.id_birdlife = 'emperor-penguin-aptenodytes-forsteri'; % birdlife
metaData.links.id_AnAge = 'Aptenodytes_forsteri'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aptenodytes_forsteri}}';
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
bibkey = 'BuchBart1986'; type = 'Article'; bib = [ ... 
'author = {Bucher, T. L. and Bartholomew, G. A. and Trivelpiece, W. Z. and Volkman, N. J.}, ' ... 
'year = {1986}, ' ...
'title = {Metabolism, growth, and activity in Ad\''{e}lie and Emperor Penguin embryos}, ' ...
'journal = {The Auk}, ' ...
'volume = {103}, ' ...
'pages = {485--493}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsWhit1999'; type = 'Incollection'; bib = [ ... 
'author = {Dawson, W. R. and Whittow, G. C.}, ' ... 
'year = {1999}, ' ...
'title = {Regulation of Body Temperature}, ' ...
'booktitle = {Sturkie''s Avian Physiology, Fifth Edition}, ' ...
'editor = {Whittow, G. C.}, ' ...
'publisher = {Academic Press}, '...
'address = {San Diego}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PTAG2005'; type = 'Book'; bib = [ ... 
'author = {Penguin Taxon Advisory Group.}, ' ... 
'year = {2005}, ' ...
'title = {Penguin Husbandry Manual Third Edition}, ' ...
'publisher = {American Zoo and Aquarium Associations}, ' ...
'address = {Silver Spring}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ston1953'; type = 'Techreport'; bib = [ ... 
'author = {Stonehouse, B.}, ' ... 
'year = {1953}, ' ...
'title = {The Emperor Penguin. {I}: Breeding Behaviour and Development.}, ' ...
'institution = {F.I.D.S. Scientific Reports}, ' ...
'volume = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\urlhttp://animaldiversity.ummz.umich.edu/accounts/Aptenodytes_forsteri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/45512074}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

