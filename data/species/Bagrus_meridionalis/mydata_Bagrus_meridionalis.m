  function [data, auxData, metaData, txtData, weights] = mydata_Bagrus_meridionalis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Bagrus_meridionalis'; 
metaData.species_en = 'Kampoyo'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 06];

%% set data
% zero-variate data
data.ab = 13; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 37;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Twed1975';
data.Lpm = 33;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'Twed1975';
data.Li = 150;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
data.Lim = 143;     units.Lim = 'cm';   label.Lim = 'ultimate total length for males';  bibkey.Lim = 'guess';

data.Wwb = 1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnjaDade2009';
  comment.Wwb = 'based on egg diameter of 0.66 mm to 1.50 mm for Bagrus docmak: pi/6*.125^3';
data.Wwp = 360;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Twed1975'};
  comment.Wwp = 'based on 0.00851*Lp^2.95, see F1';
data.Wwi = 9.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.00851*Li^2.95, see F1, gives 22.3 kg';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 3	26.564 24.904
 4	34.644 32.650
 5	40.900 38.577
 6	48.482 44.998
 7	52.250 49.767
 8	56.683 NaN
 9	61.283 NaN
10	65.388 NaN
11	69.324 NaN
12	72.595 NaN
13	76.696 NaN
14	79.140 NaN
15	80.594 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)-1)*365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(23);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'Twed1975';

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
comment.LN = 'Data for Bagrus docmak';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.Wwb = weights.Wwb * 3;
weights.Li = weights.Li * 3;
weights.Lim = weights.Lim * 0;
weights.Wwi = weights.Wwi * 0;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.5;
weights.psd.v = 3*weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^2.95'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic in Lake Malawi; symbiontic nest guarding with cichlids'; 
metaData.bibkey.F2 = 'Twed1975'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5WBBP'; % Cat of Life
metaData.links.id_ITIS = '680909'; % ITIS
metaData.links.id_EoL = '211439'; % Ency of Life
metaData.links.id_Wiki = 'Bagrus_meridionalis'; % Wikipedia
metaData.links.id_ADW = 'Bagrus_meridionalis'; % ADW
metaData.links.id_Taxo = '162817'; % Taxonomicon
metaData.links.id_WoRMS = '1019366'; % WoRMS
metaData.links.id_fishbase = 'Bagrus-meridionalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Bagrus_meridionalis}}';  
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
bibkey = 'Twed1975'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1975.tb04640.x}, ' ...
'author = {D. Tweddle}, ' ...
'year = {1975}, ' ...
'title = {Age and growth of the catfish \emph{Bagrus meridionalis} {G}unther in southern {L}ake {M}alawi}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {7(5)}, '...
'pages = {677-685}'];
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
'howpublished = {\url{https://www.fishbase.se/summary/Bagrus-meridionalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

