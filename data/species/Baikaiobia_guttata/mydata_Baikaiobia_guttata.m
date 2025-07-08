function [data, auxData, metaData, txtData, weights] = mydata_Baikaiobia_guttata

%% set metaData
metaData.phylum     = 'Platyhelminthes'; 
metaData.class      = 'Turbellaria'; 
metaData.order      = 'Tricladida'; 
metaData.family     = 'Dugesiidae';
metaData.species    = 'Baikaiobia_guttata'; 
metaData.species_en = 'Freshwater flatworm'; 

metaData.ecoCode.climate = {'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 17]; 


%% set data
% zero-variate data

data.ab = 49;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ZaitMiza2006';   
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '37 till 61 d';
data.tp = 100;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL data for Lp';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ZaitMiza2006';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.3;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ZaitMiza2006';
  comment.Lb = '1.68 till 6.72 mm';
data.Lp  = 1.0;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'guess based on relative length of Schmidtea_polychroa';
data.Li  = 2.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ZaitMiza2006';

data.Wwb = 9.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on (Lb/Li)^3 * Wwi';
data.Wwp = 0.036;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwi = 0.28;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Schmidtea_polychroa (2.0/2.2)^3 * 0.38';

data.Ri  = 4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ZaitMiza2006';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 6 young per cocoon, 1 coccon per yr is assumed';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (d), body length (cm)
 0.978	0.299
 4.838	0.401
11.310	0.461
14.563	0.442
18.427	0.532
21.243	0.525
22.745	0.562
28.795	0.592
32.273	0.551
35.468	0.694
39.838	0.582
48.478	0.631
52.185	0.556
54.990	0.578
55.848	0.601
58.882	0.590
64.912	0.676
67.307	0.635
70.127	0.620
75.075	0.703
78.559	0.647
82.229	0.673
95.129	0.913
100.151	0.793
104.612	1.026];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'body length'};  
temp.tL    = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZaitMiza2006';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Presumely hermaphroditic, so kap_R is halved';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'doubles eye number during first 60 days of their life';
metaData.bibkey.F1 = 'ZaitMiza2006'; 
F2 = 'ectolecithal eggs in cocoon: in these eggs, one or several small yolk-poor oocytes are surrounded by large numbers of yolk cells which are produced by a specialized gland, the vitellarium.';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Triclads show a unique mode of cleavage called blastomere anarchy. Instead of remaining together and forming an ordered morula of micromeres and macromeres as in other spiralian embryos, blastomeres of triclad embryos lose contact and migrate actively to various positions within the syncytial yolk';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'Temp range: 10-23 for cocoon prod, 05-23 for egg development, 10-23 for maturtion & life cycle';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/08
metaData.links.id_ITIS = ''; % ITIS not present not present 2021/08/13
metaData.links.id_EoL = ''; % Ency of Life not present 2021/08/08
metaData.links.id_Wiki = 'Turbellaria'; % Wikipedia

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tricladida}}';
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
bibkey = 'ZaitMiza2006'; type = 'Article'; bib = [ ... 
'author = {E. P. Zaitseva and I. B. Mizandrontsev and O. A. Timoshkin}, ' ... 
'year = {2006}, ' ...
'title = {Postembryonic development and growth dynamics of \emph{Baikaiobia guttata} ({G}erstfeldt, 1858) ({P}lathelminthes): first report on the life cycle of endemic {T}ricladida from {L}ake {B}aikal}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {568(S)}, ' ...
'pages = {239-245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

