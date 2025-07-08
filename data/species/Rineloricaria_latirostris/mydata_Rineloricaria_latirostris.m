  function [data, auxData, metaData, txtData, weights] = mydata_Rineloricaria_latirostris
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Loricariidae';
metaData.species    = 'Rineloricaria_latirostris'; 
metaData.species_en = 'Armored catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 24];

%% set data
% zero-variate data
data.ab = 8.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Barb1995';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.47;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Barb1995';
data.Lpm = 10.1;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';bibkey.Lpm = 'Barb1995';
data.Li = 36;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 3.58;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Barb1995'};
  comment.Wwp = 'based on 0.00437*Lp^3.14, see F1';
data.Wwi = 337;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00437*Li^3.14, see F1';
  
% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm), femles, males
    0  3.884  4.443
    1  7.892  8.607
    2  9.534 10.654
    3 10.522 13.012
    4 11.541 13.440
    6 12.031 14.490];
data.tL_fm(:,1) = (.3 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'Barb1995';

% length-fecundity
data.LN = [ ... % total lrngth (cm), fecundity(#)
8.831	 82
9.034	 55
9.208	 81
9.308	 32
9.348	 42
9.396	 63
9.646	 51
9.812	 69
9.898	 51
9.971	 11
9.986	 81
10.134	 65
10.230	 91
10.378	 77
10.489	 92
10.623	106
10.709	 90
10.906	118
11.025	126
11.086	106
11.102	114
11.173	111
11.222	141
11.238	161
11.291	107
11.385	108
11.505	164
11.513	155
11.535	131
11.609	189
11.817	122
11.852	180
11.866	149
12.024	161
12.229	193];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(24.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Barb1995';
comment.LN = 'The prediction assumes that this fecundity is montly';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL_fm = weights.tL_fm * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00437*(TL in cm)^3.14'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4T3RG'; % Cat of Life
metaData.links.id_ITIS = '680512'; % ITIS
metaData.links.id_EoL = '214769'; % Ency of Life
metaData.links.id_Wiki = 'Rineloricaria_latirostris'; % Wikipedia
metaData.links.id_ADW = 'Rineloricaria_latirostris'; % ADW
metaData.links.id_Taxo = '186151'; % Taxonomicon
metaData.links.id_WoRMS = '1018964'; % WoRMS
metaData.links.id_fishbase = 'Rineloricaria-latirostris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Rineloricaria_latirostris}}';  
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
bibkey = 'Barb1995'; type = 'Article'; bib = [ ...
'author = {Barbieri, G.}, ' ...
'year = {1995}, ' ...
'title = {Biologia do cascudo, \emph{Rineloricaria latirostris} {B}oulenger, 1899 ({S}iluriformes, {L}oricariidae) do rio {P}assa {C}inco. Ipe\''{u}na/S\~{a}o Paulo: idade e crescimento}, ' ... 
'journal = {Revista Brasileira de Biologia}, ' ...
'volume = {55(3)}, '...
'pages = {467-470}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rineloricaria-latirostris.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

