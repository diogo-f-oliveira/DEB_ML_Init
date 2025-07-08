function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_murphyi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_murphyi'; 
metaData.species_en = 'Chilean jack mackerel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPS','MASW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.3); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 20];

%% set data
% zero-variate data

data.ab = 10;   units.ab = 'd';    label.ab = 'time at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'fishbase';   
  temp.am = C2K(15.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1138;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01778*Lp^2.99, see F1';
data.Wwi = 5845; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01778*Li^2.99, see F1';

data.Ri  = 302358/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Trachurus_picturatus';
 
% uni-variate data
% time-length
data.tL =	[ % time since birth (yr), total length (cm)
    1 14.85
    2 23.78
    3 32.45
    4 38.82
    5 45.39
    6 50.16
    7 55.83
    8 59.21
    9 62.16
   10 64.83
   11 66.58];
data.tL(:,1) = 365 * (0.3+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dios2013';

% length-weight
data.LW = [ ... % total lenght (cm), weight (g)
    3    0.31
    4    0.77
    5    1.45
    6    2.17
    7    3.52
    8    5.02
    9    7.07
   10   10.27
   11   13.14
   12   16.97
   13   21.37
   14   26.67
   15   34.60
   16   40.66
   17   49.27
   18   59.29
   19   57.17
   20   66.22
   21   79.81
   22   93.21
   23  104.67
   24  107.50
   25  125.92
   26  142.85
   27  159.67
   28  173.48
   29  196.00
   30  225.33
   31  244.96
   32  251.37
   33  283.00
   34  311.60
   35  332.85
   36  348.11
   37  377.93
   38  398.44
   39  432.15
   40  479.96
   41  514.89
   42  585.48
   43  589.52
   44  662.59
   45  688.78
   46  743.44
   47  821.93
   48  855.07
   49  901.59
   50  966.44
   51  985.40
   52 1065.59
   53 1106.37
   54 1161.85
   55 1276.00
   56 1385.62
   57 1413.93
   58 1465.22
   59 1568.81
   60 1685.44
   61 1677.74
   62 1780.96
   62 1933.85
   64 2081.50
   65 2162.16
   66 2245.11
   67 2665.38
   68 2485.11
   69 2550.92
   70 2655.50
   71 2785.00];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Dios2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.comment = comment;
txtData.bibkey = bibkey;

% %% Group plots
% set1 = {'tL_N','tL_S'}; subtitle1 = {'Data from northern, southern region'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'data Wwp and Wwi ignorned due to inconsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01778*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PKV'; % Cat of Life
metaData.links.id_ITIS = '168597'; % ITIS
metaData.links.id_EoL = '46578064'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_murphyi'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_murphyi'; % ADW
metaData.links.id_Taxo = '189254'; % Taxonomicon
metaData.links.id_WoRMS = '273303'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-murphyi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_murphyi}}';
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
bibkey = 'Dios2013'; type = 'article'; bib = [ ...
'doi = {10.15381/rpb.v20i1.2618}, ' ...
'author = {Teobaldo Dioses}, ' ... 
'year = {2013}, ' ...
'title = {Age and growth of Jack mackerel \emph{Trachurus murphyi} in {P}eru}, ' ...
'journal = {Rev. peru. biol. número especial}, ' ...
'volume = {20(1)}, ' ...
'pages = {045- 052}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trachurus-murphyi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

