function [data, auxData, metaData, txtData, weights] = mydata_Electrophorus_electricus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gymnotiformes'; 
metaData.family     = 'Gymnotidae';
metaData.species    = 'Electrophorus_electricus'; 
metaData.species_en = 'Electric eel'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ah'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'L_t'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2014 05 09];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data
data.ah = 9;     units.ah = 'd';    label.ah = 'age at hatch';           bibkey.ah = 'AssuSchw1995'; 
  temp.ah = C2K(25.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ap = 3*365; units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'AssuSchw1995';
  temp.ap = C2K(25.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 22*365;units.am = 'd';    label.am = 'life span';              bibkey.am = 'ADW';    
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp guessed from distribution; am for females, 15 yr for males';

data.Lh = 0.9;   units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'AssuSchw1995'; 
  comment.Lh = '8-11 mm';
data.Lb = 1.9;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'SantVari2013';
data.L19 = 3.5;  units.L19 = 'cm';  label.L19 = 'total length at 19 d since hatch';   bibkey.L19 = 'AssuSchw1995';
  temp.L19 = C2K(25.5); units.temp.L19 = 'K'; label.temp.L19 = 'temperature';
data.L61 = 8;    units.L61 = 'cm';  label.L61 = 'total length at 61 d since hatch';   bibkey.L61 = 'AssuSchw1995';
  temp.L61 = C2K(25.5);  units.temp.L61 = 'K'; label.temp.L61 = 'temperature';
data.L915 = 70;  units.L915 = 'cm'; label.L915 = 'total length at 195 d since hatch'; bibkey.L915 = 'AssuSchw1995';
  temp.L915 = C2K(25.5); units.temp.L915 = 'K'; label.temp.L915 = 'temperature';
data.Lp = 68.5;  units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'AssuSchw1995'; 
data.Li = 250;   units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase'; 

data.Wwp = 782;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Kooy2014a';
  comment.Wwp = 'based on (68.5/ 115)^3 * 3700';
data.Wwi = 2e4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 17000/365; units.Ri = '#/d'; label.Ri = 'max reprod rate';     bibkey.Ri = {'fishbase'};   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), length (cm)
77.339	3.992
83.447	8.410
102.203	9.683
119.480	4.334
112.369	8.113
130.225	11.909
166.548	12.405
187.177	19.198
236.430	15.761
246.612	24.912
268.349	17.832
279.834	28.717
303.941	20.377
320.962	31.897
438.690	35.757
457.961	40.972
548.511	40.243
561.224	42.301
560.493	44.350
563.266	47.347
588.394	41.530
603.430	47.846
602.699	49.895
647.998	46.771
668.458	54.037
668.065	55.140
740.823	55.818
753.536	57.876
759.532	62.609
754.968	70.016
798.169	62.004
817.937	60.440
819.923	65.644
815.696	72.105
874.028	59.373
877.831	70.253
986.782	61.022
983.183	71.110];
units.tL = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
  temp.tL = C2K(25.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'AssuSchw1995'};

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

%% Facts
F1           = 'Obligatory air breather';
metaData.bibkey.F1    = 'Wiki';
F2           = 'Some 5,000 to 6,000 stacked electroplaques are capable of producing a shock at up to 600 volts and 1 ampere of current (600 watts)';
metaData.bibkey.F2    = 'Wiki';
F3           = 'There is a male-biased sex ratio, (3:1)';
metaData.bibkey.F3    = 'redlist';
F4           = 'Males are considerably larger than females (but fishtank wrongly says that males are much smaller than females)';
metaData.bibkey.F4    = {'redlist','fishtank'} ;
F5           = 'Eggs are deposited in a foam nest built by the male, using his saliva';
metaData.bibkey.F5    = 'Wiki';
F6           = 'Males are much more abundant';
metaData.bibkey.F6    = 'AssuSchw1995';
F7           = 'Stomage of 7 cm larvae only consists of eggs, that of 8 cm for 80%';
metaData.bibkey.F7    = 'AssuSchw1995';
F8           = 'Young leave the nest at 8-16 cm';
metaData.bibkey.F8    = 'AssuSchw1995';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6,'F7',F7,'F8',F8);

%% Discussion points
D1 = 'Author_mod_1: I found information on the number of eggs per female as a function of length in Anon2013 that was much higher than in Anon2015 but chose to not include it as the temperature was not provided';
% optional bibkey: bibkey.D1 = 'Anon2013';
D2 = 'Author_mod_1: I was surprised to observe that the weight coefficient for ab changed so much the parameter values';     
% optional bibkey: bibkey.D2 = 'Kooy2010';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '396VZ'; % Cat of Life
metaData.links.id_ITIS = '163322'; % ITIS
metaData.links.id_EoL = '206595'; % Ency of Life
metaData.links.id_Wiki = 'Electrophorus_electricus'; % Wikipedia
metaData.links.id_ADW = 'Electrophorus_electricus'; % ADW
metaData.links.id_Taxo = '43452'; % Taxonomicon
metaData.links.id_WoRMS = '1014794'; % WoRMS
metaData.links.id_fishbase = 'Electrophorus-electricus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Electrophorus_electricus}}';  
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
bibkey = 'SantVari2013'; type = 'Article'; bib = [ ...    
'author = {C. D. de Santana and R. P. Vari and W. B. Wosiacki}, ' ...
'year  = {2013}, ' ...
'title = {The Untold Story of the Caudal Skeleton in the Electric Eel ({O}stariophysi: {G}ymnotiformes: {E}lectrophorus)}, ' ...  
'journal = {PlosOne}, ' ...
'doi = {10.1371/journal.pone.0068719}, ' ...
'volume = {July 24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AssuSchw1995'; type = 'Article'; bib = [ ...    
'author = {Assuncao, M. I. da Silva  and Schwassmann, H. O.}, ' ...
'year  = {1995}, ' ...
'title = {Reproduction and larval development of \emph{Electrophorus electricus} on {M}arajo {I}sland ({P}ara, {B}razil)}, ' ...  
'journal = {Ichthyol. Explor. Freshwaters}, ' ...
'volume = {6}, '...
'pages = {175--184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4535}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Electrophorus_electricus/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'redlist'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/167700/0}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishtank'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishtanksandponds.co.uk/profiles/electrophorus-electricus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

