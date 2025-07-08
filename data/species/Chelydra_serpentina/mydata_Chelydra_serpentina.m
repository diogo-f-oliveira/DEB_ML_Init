function [data, auxData, metaData, txtData, weights] = mydata_Chelydra_serpentina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelydridae';
metaData.species    = 'Chelydra_serpentina'; 
metaData.species_en = 'Common snapping turtle'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv', 'biSv', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ww_L'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'T-a_b'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 05];

%% set data
% zero-variate data

data.tp = 18*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'COSEWIC';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 17*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'COSEWIC';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'between 15 and 20 yr';
data.am = 47*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 25.4; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';   bibkey.Lp = 'COSEWIC';
data.Li = 45; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'ADW';

data.Wwb = 8.24; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'COSEWIC';
data.Wwi = 16000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'ADW';
data.Ww22 = 6000; units.Ww22 = 'g';  label.Ww22 = 'weight at 22.5 cm carapace length';  bibkey.Ww22 = 'Wiki';

data.Ri  = 36/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'COSEWIC';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
3.144	7.310
8.916	8.095
122.700	18.356
161.757	26.093
179.971	27.005
189.047	26.661
223.537	27.850
250.004	31.781
285.241	39.688
316.345	39.926
364.675	40.279];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WilliSpot1989';
comment.tW = 'no growth at 15 C';

% timeperature-incubation time
data.Tab = [ ... % temperature (C), incubation time (d)
20	140.570
22	92.951
24	73.336
26	69.183
28	64.335
30	62.273];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Ynte1978';

%% set weights for all real data
weights = setweights(data, []);
weights.Tab = 3 * weights.Tab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Between 23 and 28 C, males develop from eggs, below and  above the range females';
metaData.bibkey.F1 = 'COSEWIC';
F2 = 'Males are larger tha females'; 
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'TWRZ'; % Cat of Life
metaData.links.id_ITIS = '173752'; % ITIS
metaData.links.id_EoL = '795409'; % Ency of Life
metaData.links.id_Wiki = 'Chelydra_serpentina'; % Wikipedia
metaData.links.id_ADW = 'Chelydra_serpentina'; % ADW
metaData.links.id_Taxo = '48499'; % Taxonomicon
metaData.links.id_WoRMS = '1378193'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chelydra&species=serpentina'; % ReptileDB
metaData.links.id_AnAge = 'Chelydra_serpentina'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelydra_serpentina}}';
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
bibkey = 'WilliSpot1989'; type = 'Article'; bib = [ ... 
'author = {L. U. Williamson and J. R. Spotila and E. A. Standora}, ' ... 
'year = {1989}, ' ...
'title = {GROWTH, SELECTED TEMPERATURE AND {C}{T}{M} OF YOUNG SNAPPING TURTLES, \emph{Chelydra serpentina}}, ' ...
'journal = {J. therm. Biol.}, ' ...
'number = {1}, ' ...
'volume = {14}, ' ...
'pages = {33--39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ynte1978'; type = 'Article'; bib = [ ... 
'author = {C. L. Yntema}, ' ... 
'year = {1978}, ' ...
'title = {Incubation Times for Eggs of the Turtle \emph{Chelydra serpentina} ({T}estudines: {C}helydridae) at Various Temperatures}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {34(3)}, ' ...
'pages = { 274-277}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Chelydra_serpentina/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chelydra_serpentina}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'COSEWIC'; type = 'Techreport'; bib = [ ...
'year = {2008}, ' ...
'title = {COSEWIC Assessment and Status Report on the Snapping Turtle Chelydra serpentina in Canada}, ' ...
'institution = {Committee on the Status of Endangered Wildlife in Canada}, ' ...
'howpublished = {\url{http://publications.gc.ca/collections/collection_2009/ec/CW69-14-565-2009E.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
