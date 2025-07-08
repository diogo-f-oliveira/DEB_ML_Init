  function [data, auxData, metaData, txtData, weights] = mydata_Tinca_tinca

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Tinca_tinca'; 
metaData.species_en = 'Tench'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 15]; 

%% set data
% zero-variate data
data.ah = 5.5;        units.ah = 'd';  label.ah = 'age at hatch';                   bibkey.ah = 'Beel2008'; 
  temp.ah = C2K(20); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 13;       units.ab = 'd';  label.ab = 'age at birth';                   bibkey.ab = 'Beel2008'; 
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6 to 10 d';
data.tp = 3.5*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'Beel2008';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males'; bibkey.tpm = 'Beel2008';
  temp.tpm = C2K(20); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'Beel2008';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.45;   units.Lh = 'cm'; label.Lh = 'total length at hatch';              bibkey.Lh = 'Beel2008'; 
data.Lb = 0.53;    units.Lb = 'cm'; label.Lb = 'total length at birth';             bibkey.Lb = 'Beel2008'; 
data.Lp = 24;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'Beel2008'; 
  comment.Lp = '18 to 30 cm';
data.Lpm = 15.5;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Beel2008'; 
  comment.Lpm = '11 to 20 cm';
data.Li = 84;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'Beel2008';

data.Wwb = 2.7e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'Beel2008';
  comment.Wwb = 'Computed from egg diameter of 0.8 mm (range 0.29 to 1.14 mm): 4/3*pi*0.04^3';
data.Wwp = 239;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';bibkey.Wwp = 'Beel2008';
  comment.Wwp = 'Computed as 0.018654 * Lp^2.9762, see F1';
data.Wwpm = 65;   units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';bibkey.Wwpm = 'Beel2008';
  comment.Wwpm = 'Computed as 0.018654 * Lpm^2.9762, see F1';
data.Wwi = 9.95e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Beel2008';
  comment.Wwi = 'Computed from 0.018654 * Li^2.9762, see F1';    

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 1 13.75
 2 20.52
 3 27.47
 4 32.96
 5 37.22
 6 39.68
 7 42.07
 8 43.95
 9 45.46
10 46.47
11 48.55];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PompFran2012';
comment.tL = 'Data from Trasimeno Lake';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
26.0 118500
32.6 445600
42.3 868900];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Beel2008';

% weight-fecundity
data.WN = [ ... % wet weight (9), fecundity (#)
 450 118500
 812 445600
1622 868900];
units.WN = {'g', '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(20);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Beel2008';

%% set weights for all real data
weights = setweights(data, []);

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
F1 = 'Length-weight: Ww (in g) = 0.018654 * (TL in cm)^2.9762';
metaData.bibkey.F1 = 'Beel2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56ZWM'; % Cat of Life
metaData.links.id_ITIS = '163348'; % ITIS
metaData.links.id_EoL = '46581781'; % Ency of Life
metaData.links.id_Wiki = 'Tinca_tinca'; % Wikipedia
metaData.links.id_ADW = 'Tinca_tinca'; % ADW
metaData.links.id_Taxo = '43684'; % Taxonomicon
metaData.links.id_WoRMS = '154343'; % WoRMS
metaData.links.id_fishbase = 'Tinca-tinca'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tinca_tinca}}';  
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
bibkey = 'Beel2008'; type = 'Techreport'; bib = [ ...  
'author = {P. Beelen}, ' ...
'year = {2008}, ' ...
'title = {Kennisdocument zeelt, \emph{Tinca tinca} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {24}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-zeelt_4887.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/269}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PompFran2012'; type = 'Article'; bib = [ ...  
'author = {L. Pompei and E. Franchi and D. Giannetto and M. Lorenzoni}, ' ...
'year = {2012}, ' ...
'title = {Growth and reproductive properties of Tench, \emph{Tinca tinca} {L}innaeus, 1758 in {T}rasimeno {L}ake ({U}mbria, {I}taly)}, ' ... 
'journal = {Knowledge and Management of A quatic Ecosystems (2012) 406, 07}, ' ...
'volume = {406}, '...
'number = {7}, ' ...
'howpublished = {\url{https://www.kmae-journal.org/articles/kmae/pdf/2012/03/kmae120039.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
