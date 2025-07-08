  function [data, auxData, metaData, txtData, weights] = mydata_Bagrus_docmak
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Bagrus_docmak'; 
metaData.species_en = 'Semutundu'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 27];

%% set data
% zero-variate data
data.ab = 11.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22.7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 127;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnjaDade2009';
  comment.Wwb = 'based on egg diameter of 0.66 mm to 1.50 mm: pi/6*.125^3';
data.Wwp = 200;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*35e3';
data.Wwi = 35e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.00933*Li^3.00, see F1, gives 9.5 kg';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 25.0
    2 33.3
    3 39.9
    4 47.8
    5 58.3
    6 71.0];
data.tL(:,1) = (data.tL(:,1)+0.5)*365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Khal1988';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
    20  130
    25  300
    30  450
    35  750
    40 1056
    45 1500
    50 2000
    55 3050
    60 3800
    65 4950
    70 5850
    75 8700
    85 10538
    90 11250
    95 18875];
units.LW = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'Khal1988';

% length-fecundity
data.LN = [ ... % log10 fork length (cm), log10 fecundity (#)
1.776	4.992
1.785	4.906
1.786	5.057
1.787	4.987
1.791	4.949
1.814	5.037
1.818	5.120
1.828	5.191
1.830	5.120
1.830	4.972
1.831	5.067
1.834	5.014
1.835	5.052
1.837	4.984
1.838	5.105
1.839	5.138
1.841	5.216
1.843	5.321
1.844	5.113
1.846	5.372
1.848	5.160
1.849	5.236
1.851	5.344
1.853	5.014
1.855	5.183
1.855	5.108
1.858	5.004
1.859	5.080
1.862	5.198
1.864	5.125
1.866	5.407
1.867	5.228
1.870	5.173
1.873	5.030
1.874	5.057
1.874	5.138
1.874	5.088
1.875	5.251
1.877	5.354
1.881	5.226
1.882	5.113
1.885	5.130
1.886	5.402
1.886	5.339
1.893	5.281
1.895	5.307
1.896	5.181
1.898	5.241
1.899	5.327
1.902	5.392
1.902	5.284
1.909	5.221
1.909	5.256
1.911	5.425
1.912	5.307
1.914	5.279
1.917	5.334
1.920	5.269
1.923	5.478
1.926	5.513
1.926	5.641
1.926	5.433
1.926	5.561
1.927	5.395
1.929	5.254
1.929	5.334
1.938	5.770
1.941	5.314
1.941	5.382
1.942	5.576
1.945	5.289
1.946	5.599
1.947	5.624
1.953	5.413
1.954	5.551
1.957	5.508
1.959	5.654
1.959	5.460
1.960	5.561
1.962	5.340
1.967	5.418
1.970	5.622
1.972	5.798
1.972	5.511
1.985	5.544
1.987	5.483
1.989	5.614
1.992	5.730
1.993	5.647
1.995	5.581];
data.LN = 10.^data.LN; % remove log transform
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN = C2K(23);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'AnjaDade2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68BBX'; % Cat of Life
metaData.links.id_ITIS = '680909'; % ITIS
metaData.links.id_EoL = '50957990'; % Ency of Life
metaData.links.id_Wiki = 'Bagrus'; % Wikipedia
metaData.links.id_ADW = 'Bagrus_docmac'; % ADW
metaData.links.id_Taxo = '162817'; % Taxonomicon
metaData.links.id_WoRMS = '1019366'; % WoRMS
metaData.links.id_fishbase = 'Bagrus-docmak'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Bagrus}}';  
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
bibkey = 'Khal1988'; type = 'Article'; bib = [ ...
'doi = {10.1002/rrr.3450020407}, ' ...
'author = {Khallaf, E. A.}, ' ...
'year = {1988}, ' ...
'title = {Effect of impoundment on the growth and fishery of \emph{Bagrus docmac} in lake {N}asser}, ' ... 
'journal = {Regulated Rivers: Research \& Management}, ' ...
'volume = {2(4)}, '...
'pages = {547–552}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnjaDade2009'; type = 'Article'; bib = [ ...
'author = {Hailu Anja and Elias Dadebo and Seyoum Mengistou}, ' ...
'year = {2009}, ' ...
'title = {REPRODUCTIVE BIOLOGY AND CONDITION FACTOR OF THE CATFISH \emph{Bagrus docmak} ({F}ORSSK{\aa}L) ({P}ISCES: {B}AGRIDAE) IN {L}AKE {C}HAMO, {E}THIOPIA}, ' ... 
'journal = {Ethiop. J. Sci.}, ' ...
'volume = {32(1)}, '...
'pages = {29–36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bagrus-docmak.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

