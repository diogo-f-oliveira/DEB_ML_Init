function [data, auxData, metaData, txtData, weights] = mydata_Anaxyrus_americanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Anaxyrus_americanus'; 
metaData.species_en = 'American toad'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 14]; 


%% set data 
% zero-variate data

data.ab = 8;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = {'amphibiaweb','AnAge'};   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3 to 12 d';
data.tj = 55;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '50 to 60 d; AnAge gives 63 d';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2 to 4 yr';
data.am = 36*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'amphibiaweb'; 
  comment.Lj = 'SVL 7 to 12 mm; TL 2.5 cm ';
data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 11.1;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'amphibiaweb';
data.Lim  = 8.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'amphibiaweb';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 1 to 2 mm: pi/6*0.2^3';
data.Wwj = 0.18; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Beac2001';
data.Wwi = 120;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'Hami1934','amphibiaweb'};
  comment.Wwi = 'based on 30 * (Li/7)^3 from LW data; ';
data.Wwim = 54;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = {'Hami1934','amphibiaweb'};
  comment.Wwim = 'based on: 30 * (Lim/7)^3';
  
data.Ri  = 8e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '4000 to 12000 eggs/clutch; 1 clutch/year';
 
% uni-variate data
% time-weight
data.tW_m = [ ... % time (d), body weight (g)
    0  6
    6  7
   10  8
   33 18.3
   50 25.5
   60 30];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'wet weight'};  
temp.tW_m    = C2K(35);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Hami1934';
comment.tW_m = 'in view of fast growth, temperature in June to Sept is guessed high';
  
% length-weight
data.LW = [ ... % SVL (d), body weight (g)
    3.2  6.1
    3.5  3.9
    3.7  6
    4.1  7
    4.3  8
    5.8 18.3
    6.3 25.2
    6.8 33
    7.0 30
    7.3 35];
units.LW   = {'cm', 'g'};  label.LW = {'SVL', 'wet weight'};  
bibkey.LW = 'Hami1934';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = 3 * weights.tW_m;

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
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '66LTT'; % Cat of Life
metaData.links.id_ITIS = '773511'; % ITIS
metaData.links.id_EoL = '1019159'; % Ency of Life
metaData.links.id_Wiki = 'Anaxyrus_americanus'; % Wikipedia
metaData.links.id_ADW = 'Anaxyrus_americanus'; % ADW
metaData.links.id_Taxo = '988885'; % Taxonomicon
metaData.links.id_WoRMS = '1525331'; % WoRMS
metaData.links.id_amphweb = 'Anaxyrus+americanus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Anaxyrus_americanus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anaxyrus_americanus}}';
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
bibkey = 'Hami1934'; type = 'Article'; bib = [ ... 
'author = {W. J. Hamilton}, ' ... 
'year = {1934}, ' ...
'title = {The Rate of Growth of the Toad (\emph{Bufo americanus americanus} {H}olbrook) under Natural Conditions}, ' ...
'journal = {Copeia}, ' ...
'volume = {1934}, ' ...
'pages = {88-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beac2001'; type = 'Article'; bib = [ ... 
'author = {Christopher K. Beachy}, ' ... 
'year = {2001}, ' ...
'title = {Effects of Growth History and Exogenous Thyroxine on Size and Age at Metamorphosis in the Toad \emph{Bufo americanus}}, ' ...
'journal = {Copeia}, ' ...
'volume = {2001}, ' ...
'pages = {829-834}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?scientific_name=Anaxyrus+americanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anaxyrus_americanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

